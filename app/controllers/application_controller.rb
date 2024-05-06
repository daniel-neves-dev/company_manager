class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_ransack_employees, if: :employees_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def set_ransack_employees
    @ransack_employees = Employee.ransack(params[:q])
  end

  def employees_controller?
    controller_name == 'employees'
  end
end
