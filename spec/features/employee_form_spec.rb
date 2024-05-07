require 'rails_helper'

describe 'Employee Forms', type: :feature, js: true do
  context 'New Employee Form' do
    before { visit new_employee_path(locale: I18n.locale) }

    it 'does not show the status field' do
      expect(page).not_to have_selector('input[name="employee[status]"]')
    end
  end

  context 'Edit Employee Form' do
    let!(:employee) { FactoryBot.create(:employee) }
    before { visit edit_employee_path(employee, locale: I18n.locale) }

    it 'shows the status field' do
      expect(page).to have_selector('select[name="employee[status]"]')
    end
  end
end
