class PayrollReportsController < ApplicationController
  def index
    @payroll_reports = PayrollReport.order(:id)
  end

  def import
    begin
      PayrollReport.import(params[:file])
      flash[:success] = "Payroll data imported."
      redirect_to root_url
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:error] = invalid.record.errors
      redirect_to root_url
    end
  end
end
