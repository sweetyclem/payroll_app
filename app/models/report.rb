class Report < ApplicationRecord
  belongs_to :employee
  
  def self.generate(employee_ids, upload_number)
    employee_ids.each do |employee_id|
      employee = Employee.find(employee_id)
      employee.work_logs.each do |work_log|
        puts "--------------IDS " + employee_ids.inspect
        puts "--------------WORK LOG " + work_log.inspect
        if work_log.upload_number == upload_number
          if work_log.date.day >= 1 && work_log.date.day <= 15
            pay_period = 1
          else
            pay_period = 2
          end
          report = Report.where(:employee_id => employee.id, :pay_period => pay_period).first_or_create
          report.upload_number = upload_number
          report.pay_month = work_log.date.month
          report.pay_year = work_log.date.year
          if employee.job_group == "A"
            report.amount_paid += work_log.hours_worked * 20
          else
            report.amount_paid += work_log.hours_worked * 30          
          end
          report.save!
        end
      end
    end
  end
end
