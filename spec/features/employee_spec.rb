require 'rails_helper'

RSpec.describe 'Employee navigation', type: :feature do
  let(:employee) { FactoryBot.create(:employee) }

  describe 'Employee index page' do
    it 'Display "Employees" title', type: :feature, js: true do
      visit employees_path
      expect(page).to have_content("Employees")
    end
  end
end