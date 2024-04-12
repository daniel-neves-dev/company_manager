
FactoryBot.define do
  factory :employee do
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    sequence(:employee_id) { |n| "EMP#{n}" }
    department { :finance }
    role { :coordinator }
    sequence(:email) { |n| "john.doe#{n}@example.com" }
    status { :active }
  end
end

