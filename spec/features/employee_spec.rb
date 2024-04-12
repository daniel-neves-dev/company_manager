require 'rails_helper'

RSpec.describe 'Employee navigation', type: :feature do
  let!(:employee) { FactoryBot.create(:employee) }

  describe 'Employee index page', type: :feature, js: true do
    before do
      visit employees_path(locale: I18n.locale)
    end

    it 'Display "Employees" title' do
      expect(page).to have_content("Add Employee")
    end

    it 'Display employee full name' do
      expect(page).to have_content(employee.full_name)
    end

    it 'has a link to add new employee' do
      expect(page).to have_link("Add Employee")
    end
  end

  describe 'Employee new page', type: :feature, js: true do
    it 'redirect to new page' do
      visit employees_path(locale: I18n.locale)
      click_link I18n.t('add_employee')
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'creates an employee from the new form page', type: :feature, js: true do
      visit new_employee_path(locale: I18n.locale)

      fill_employee_form_with('John', 'Joe', 'Finance', 'Coordinator', 'john.doe@example.com')
      click_button('Add Employee')

      expect(page).to have_content(/[A-Z]{2}\d{4}/)

      expect_employee_to_be_shown('John', 'Joe', 'Finance', 'Coordinator', 'john.doe@example.com', 'Active')
    end

  end

  describe 'Employee show page', type: :feature, js: true do
    before { visit employee_path(employee, locale: I18n.locale) }

    it 'shows employee details' do
      expect_employee_to_be_shown(employee.first_name, employee.last_name, employee.employee_id, 'Finance', 'Coordinator', employee.email, 'Active')
    end
  end

  describe 'Employee edit page', type: :feature, js: true do
    let!(:employee) { FactoryBot.create(:employee, first_name: "John", email: "valid@example.com") }

    it 'updates employee information' do
      visit edit_employee_path(employee, locale: I18n.locale)
      fill_employee_form_with('Jane', 'Doe', 'Finance', 'Manager', 'jane.doe@example.com', 'Active')
      click_button('Save Changes')
      expect_employee_to_be_shown('Jane', 'Doe', 'Finance', 'Manager', 'jane.doe@example.com', 'Active')
    end
  end

  describe 'delete', type: :feature, js: true do
    it 'deletes the employee'do
      visit employee_path(employee, locale: I18n.locale)
      page.accept_confirm do
        click_on('Delete', match: :first)
      end
      expect(page).not_to have_content(employee.first_name)
      expect(Employee.exists?(employee.id)).to be_falsey
    end
  end

  def fill_employee_form_with(first_name, last_name, department, role, email, status = nil)
    fill_in 'employee_first_name', with: first_name
    fill_in 'employee_last_name', with: last_name
    select department, from: 'employee_department'
    select role, from: 'employee_role'
    fill_in 'employee_email', with: email
    select status, from: 'employee_status' if status.present?
  end

  def expect_employee_to_be_shown(first_name, last_name, department, role, email, status, employee_id = nil)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(department)
    expect(page).to have_content(role)
    expect(page).to have_content(email)
    expect(page).to have_content(status)
    expect(page).to have_content(employee_id) if employee_id.present?
  end

end