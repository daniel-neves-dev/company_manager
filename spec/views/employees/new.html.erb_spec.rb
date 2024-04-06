require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      first_name: "MyString",
      last_name: "MyString",
      employee_id: "MyString",
      department: 1,
      role: 1,
      status: 1
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[employee_id]"

      assert_select "input[name=?]", "employee[department]"

      assert_select "input[name=?]", "employee[role]"

      assert_select "input[name=?]", "employee[status]"
    end
  end
end
