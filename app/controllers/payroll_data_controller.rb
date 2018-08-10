class PayrollDataController < ApplicationController
  def index
    @payroll_data = PayrollDatum.order(:employee_id)
  end

  def import
    PayrollDatum.import(params[:file])
  
    redirect_to root_url, notice: 'Payroll data imported.'
  end
end
