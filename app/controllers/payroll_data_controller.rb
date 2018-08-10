class PayrollDataController < ApplicationController
  def index
    @payroll_data = PayrollDatum.order(:employee_id)
  end
end
