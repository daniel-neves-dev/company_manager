# spec/factories/employees.rb
FactoryBot.define do
  factory :employee do
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    sequence(:employee_id) { |n| "EMP#{n}" }
    department { "Engineering" }
    role { "Developer" }
    status { "Active" }
  end
end
