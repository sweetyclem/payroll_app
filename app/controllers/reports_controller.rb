class ReportsController < ApplicationController
  def display
    @reports = Report.where(upload_number: params[:upload_number]).order(:employee_id, :pay_year, :pay_month, :pay_period)
  end
end
