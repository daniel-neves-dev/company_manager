require 'rails_helper'

RSpec.describe 'Employee navigation', type: :feature do
  let(:employee) { FactoryBot.create(:employee) }

  describe 'Employee index page', type: :feature, js: true do
    it 'Display "Employees" title' do
      visit employees_path
      expect(page).to have_content("Add Employee")
    end

    it 'has links to add new employee' do
      visit employees_path
      expect(page).to have_content("Employees")
    end
  end

  describe 'Employee new page', type: :feature, js: true do

    it 'redirect to new page' do
      visit employees_path
      click_on('Add Employee')
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'has a form to fill' do

      visit new_employee_path

      expect(page).to have_field('employee_first_name')
      expect(page).to have_field('employee_last_name')
      expect(page).to have_field('employee_employee_id')
      expect(page).to have_field('employee_department')
      expect(page).to have_field('employee_role')
      expect(page).to have_field('employee_status')

      expect(page).to have_selector('input[type="submit"]')
    end

    it 'creates an employee from the new form page' do
      first_name = "John"
      last_name = "Joe"
      employee_id = "EMP001"
      department = "Finance"
      role = "Coordinator"
      status = "Active"

      visit new_employee_path

      fill_in 'employee[first_name]', with: first_name
      fill_in 'employee[last_name]', with: last_name
      fill_in 'employee[employee_id]', with: employee_id

      select department, from: 'employee[department]'
      select role, from: 'employee[role]'
      select status, from: 'employee[status]'

      click_button('Add Employee')

      expect(page).to have_content(first_name)
      expect(page).to have_content(last_name)
      expect(page).to have_content(employee_id)
      expect(page).to have_content(department)
      expect(page).to have_content(role)
      expect(page).to have_content(status)
    end
  end

  it 'show a list of employees names', type: :feature, js: true do
    FactoryBot.create(:employee, first_name: 'John', last_name: 'Doe', employee_id: 'EMP001')
    FactoryBot.create(:employee, first_name: 'Jane', last_name: 'Peg', employee_id: 'EMP002')

    visit employees_path

    expect(page).to have_content('John Doe')
    expect(page).to have_content('Jane Peg')
  end

  describe 'Employee show page', type: :feature, js: true do
    it 'show a employees details' do
      employee = FactoryBot.create(:employee, first_name: 'John', last_name: 'Doe', employee_id: 'EMP001', department: 'finance', role: 'analyst', status: 'active')

      visit employee_path(employee)

      expect(page).to have_content('John')
      expect(page).to have_content('Doe')
      expect(page).to have_content('EMP001')
      expect(page).to have_content('Finance')
      expect(page).to have_content('Analyst')
      expect(page).to have_content('Active')
    end
  end

  describe 'Employee edit page', type: :feature, js: true do
    it 'redirect to edit page' do
      visit employee_path(employee)
      click_on('Edit')
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'has a form to edit' do

      visit new_employee_path

      expect(page).to have_field('employee_first_name')
      expect(page).to have_field('employee_last_name')
      expect(page).to have_field('employee_employee_id')
      expect(page).to have_field('employee_department')
      expect(page).to have_field('employee_role')
      expect(page).to have_field('employee_status')

      expect(page).to have_selector('input[type="submit"]')
    end

    it 'creates an employee from the new form page' do
      first_name = "John"
      last_name = "Joe"
      employee_id = "EMP001"
      department = "Finance"
      role = "Coordinator"
      status = "Active"

      visit edit_employee_path(employee)

      fill_in 'employee[first_name]', with: first_name
      fill_in 'employee[last_name]', with: last_name
      fill_in 'employee[employee_id]', with: employee_id

      select department, from: 'employee[department]'
      select role, from: 'employee[role]'
      select status, from: 'employee[status]'

      click_button('Save Changes')

      expect(page).to have_content(first_name)
      expect(page).to have_content(last_name)
      expect(page).to have_content(employee_id)
      expect(page).to have_content(department)
      expect(page).to have_content(role)
      expect(page).to have_content(status)
    end
  end
end