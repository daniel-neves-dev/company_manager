class Employee < ApplicationRecord

  validates :first_name, :last_name, :department, :role, :status, presence: true

  enum department: {human_resource:0, information_technology:1, finance:2, sales:3, operations:4}
  enum role: {manager:0, senior_specialist:1, analyst:2, coordinator:3, engineer:4}
  enum status: {active:0, on_leave:1, resigned:2, retired:3, under_review:4}

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end
