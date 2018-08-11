class PayrollReport < ApplicationRecord
  has_many :payroll_data, dependent: :destroy
  has_many :payroll_items, dependent: :destroy
  validates :id, uniqueness:
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    header.collect! { |column_name|
      column_name == "date"? column_name : column_name.gsub!(" ", "_")
    }
    id = spreadsheet.row(spreadsheet.last_row)[1]
    payroll_report = PayrollReport.find_or_create_by(id: id)
    payroll_report.save!
    (2..spreadsheet.last_row - 1).each do |i|
      PayrollDatum.import(header, spreadsheet.row(i), id)
    end
    calculate_report id
  end 
  
  def self.calculate_report id
    payroll_report = PayrollReport.find_by(id: id)
    payroll_data = payroll_report.payroll_data
    employees = Hash.new
    payroll_data.each do |payroll_datum|
      if payroll_datum.date.day >= 1 && payroll_datum.date.day <= 15
        pay_period = 1
      else
        pay_period = 2
      end
      payroll_item = PayrollItem.where(:employee_id => payroll_datum.employee_id, :pay_period => pay_period).first_or_create
      if payroll_datum.job_group == "A"
        payroll_item.amount_paid += payroll_datum.hours_worked * 20
      else
        payroll_item.amount_paid += payroll_datum.hours_worked * 30        
      end
      payroll_item.save!
    end
  end
end
