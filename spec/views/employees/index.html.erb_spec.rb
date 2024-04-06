require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        employee_id: "Employee",
        department: 2,
        role: 3,
        status: 4
      ),
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        employee_id: "Employee",
        department: 2,
        role: 3,
        status: 4
      )
    ])
  end

  it "renders a list of employees" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Employee".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
