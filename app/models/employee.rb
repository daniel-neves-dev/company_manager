class Employee < ApplicationRecord
  before_create :generate_employee_id
  after_initialize :set_default_status, if: :new_record?
  before_validation :normalize_email

  has_one_attached :photo
  validates :first_name, :last_name, :department, :role, :status, presence: true

  enum department: {human_resource:0, information_technology:1, finance:2, sales:3, operations:4}
  enum role: {manager:0, senior_specialist:1, analyst:2, coordinator:3, engineer:4}
  enum status: {active:0, on_leave:1, resigned:2, retired:3, under_review:4}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, allow_blank: true, allow_nil: true, uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX, message: :email_format }

  def self.ransackable_attributes(auth_object = nil)
    %w[department email first_name last_name role]
  end

  # Optionally, ensure associations are not searchable unless needed
  def self.ransackable_associations(auth_object = nil)
    []
  end

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end

  private
  def normalize_email
    self.email = email.blank? ? nil : email
  end
  def set_default_status
    self.status ||= :active
  end

  def generate_employee_id
    loop do
      random_number = rand(1000..9999)
      self.employee_id = "#{first_name[0]}#{last_name[0]}#{random_number}"
      break unless Employee.exists?(employee_id: employee_id)
    end
  end
end
