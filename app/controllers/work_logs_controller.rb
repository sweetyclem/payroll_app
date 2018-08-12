class WorkLogsController < ApplicationController
  def import
    begin
      ids_and_upload_num = WorkLog.import(params[:file])
      Report.generate(ids_and_upload_num[0], ids_and_upload_num[1])
      flash[:success] = "Payroll data imported."
      redirect_to "/display/#{ids_and_upload_num[1]}"
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:error] = invalid.record.errors
      redirect_to root_url
    end
  end
end
