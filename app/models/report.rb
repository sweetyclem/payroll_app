class Report < ApplicationRecord
  belongs_to :employee
  
  def self.generate(employee_ids, upload_number)
    employee_ids.each do |employee_id|
      employee = Employee.find(employee_id)
puts "-----------------EMPLOYEE ID"
puts employee.id
      employee.work_logs.select{|log| log.upload_number == upload_number}.each do |work_log|
        if work_log.date.day >= 1 && work_log.date.day <= 15
          pay_period = 1
        else
          pay_period = 2
        end
        report = Report.where(:employee_id => employee.id, :pay_period => pay_period).first_or_create
puts "-----------------REPORT ID"
puts report.id
        report.pay_period = pay_period
        report.employee_id = employee.id
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
