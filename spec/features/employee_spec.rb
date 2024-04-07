require 'rails_helper'

RSpec.describe 'Employee navigation', type: :feature do
  let(:employee) { FactoryBot.create(:employee) }

  describe 'Employee index page' do
    it 'Display "Employees" title', type: :feature, js: true do
      visit employees_path
      expect(page).to have_content("Employees")
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
    it 'show a employees details',type: :feature do
      employee = FactoryBot.create(:employee, first_name: 'John', last_name: 'Doe', employee_id: 'EMP001', department:'finance', role:'analyst', status:'active')

      visit employee_path(employee)

      expect(page).to have_content('John')
      expect(page).to have_content('Doe')
      expect(page).to have_content('EMP001')
      expect(page).to have_content('finance')
      expect(page).to have_content('analyst')
      expect(page).to have_content('active')
    end
  end
end