require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  let(:employee) {
    Employee.create!(
      first_name: "MyString",
      last_name: "MyString",
      employee_id: "MyString",
      department: 1,
      role: 1,
      status: 1
    )
  }

  before(:each) do
    assign(:employee, employee)
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(employee), "post" do

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[employee_id]"

      assert_select "input[name=?]", "employee[department]"

      assert_select "input[name=?]", "employee[role]"

      assert_select "input[name=?]", "employee[status]"
    end
  end
end
