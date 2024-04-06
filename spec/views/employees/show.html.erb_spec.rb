require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    assign(:employee, Employee.create!(
      first_name: "First Name",
      last_name: "Last Name",
      employee_id: "Employee",
      department: 2,
      role: 3,
      status: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Employee/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
