require 'rails_helper'

RSpec.describe 'Employee navigation', type: :feature do
  let!(:employee) { FactoryBot.create(:employee) }


  describe 'Employee index page', type: :feature, js: true do
    before do
      visit employees_path
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
      visit employees_path
      click_link('Add Employee')
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'creates an employee from the new form page', type: :feature, js: true do
      visit new_employee_path

      fill_employee_form_with('John', 'Joe', 'EMP001', 'Finance', 'Coordinator', 'Active')
      click_button('Add Employee')
      expect_employee_to_be_shown('John', 'Joe', 'EMP001', 'Finance', 'Coordinator', 'Active')
    end
  end

  describe 'Employee show page', type: :feature, js: true do
    it 'shows employee details' do
      visit employee_path(employee)

      expect(page).to have_content(employee.first_name)
      expect(page).to have_content(employee.last_name)
      expect(page).to have_content(employee.employee_id)
      expect(page).to have_content('Finance')
      expect(page).to have_content('Coordinator')
      expect(page).to have_content('Active')
      end
  end

  describe 'Employee edit page', type: :feature, js: true do
    it 'updates employee information' do
      visit employee_path(employee)
      click_on('Edit')
      fill_employee_form_with('Jane', 'Doe', 'EMP002', 'Finance', 'Manager', 'Retired')
      click_button('Save Changes')
      expect_employee_to_be_shown('Jane', 'Doe', 'EMP002', 'Finance', 'Manager', 'Retired')
    end
  end

  describe 'delete', type: :feature, js: true do
    it 'deletes the employee' do
      visit employee_path(employee)
      page.accept_confirm do
        click_on('Delete', match: :first)
      end
      expect(page).not_to have_content(employee.first_name)
      expect(Employee.exists?(employee.id)).to be_falsey
    end
  end

  def fill_employee_form_with(first_name, last_name, employee_id, department, role, status)
    fill_in 'employee[first_name]', with: first_name
    fill_in 'employee[last_name]', with: last_name
    fill_in 'employee[employee_id]', with: employee_id
    select department, from: 'employee[department]'
    select role, from: 'employee[role]'
    select status, from: 'employee[status]'
  end

  def expect_employee_to_be_shown(first_name, last_name, employee_id, department, role, status)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(employee_id)
    expect(page).to have_content(department)
    expect(page).to have_content(role)
    expect(page).to have_content(status)
  end

end