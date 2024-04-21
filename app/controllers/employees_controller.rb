class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @ransack_employees = Employee.ransack(params[:q]) || {}
    @employees = @ransack_employees.result(distinct: true)
  end


  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.email = nil if @employee.email.blank?

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: I18n.t(:create_employee) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @employee.email = nil if @employee.email.blank?
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee),notice:  I18n.t(:update_employee) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_url, notice: I18n.t(:delete_employee) }

    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :department, :role, :status, :email, :photo,
                                       )
    end
end
