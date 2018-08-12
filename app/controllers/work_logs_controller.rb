class WorkLogsController < ApplicationController
  def import
    begin
      ids_and_upload_num = WorkLog.import(params[:file])
      Report.generate(ids_and_upload_num[0], ids_and_upload_num[1])
      flash[:success] = "Payroll data imported."
      redirect_to "/display/#{ids_and_upload_num[1]}"
    rescue Exception => e
      if e.class == ActiveRecord::RecordInvalid 
        flash[:error] = "#{e.record.errors.messages.keys[0]} #{e.record.errors.messages.values[0][0]}".capitalize
      else
        flash[:error] = e.message
      end
      redirect_to root_url
    end
  end
end
