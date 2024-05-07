class MainsController < ApplicationController
  def index
    @ransack_employees = Employee.ransack(params[:q]) || {}
    @employees = @ransack_employees.result(distinct: true)
  end
end
