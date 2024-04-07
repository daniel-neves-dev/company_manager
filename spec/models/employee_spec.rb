require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:employee_id) }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:status) }
  end
end
