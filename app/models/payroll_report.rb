class PayrollReport < ApplicationRecord
  has_many :payroll_data, dependent: :destroy
  validates :id, uniqueness:
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    header.collect! { |column_name|
      column_name == "date"? column_name : column_name.gsub!(" ", "_")
    }
    id = spreadsheet.row(spreadsheet.last_row)[1]
    payroll_report = PayrollReport.find_or_create_by(id: id)
    (2..spreadsheet.last_row - 1).each do |i|
      PayrollDatum.import(header, spreadsheet.row(i), id)
    end
    payroll_report.save!
    calculate_report id
  end 
  
  def self.calculate_report id
    payroll_data = PayrollDatum.find_by(payroll_report_id: id)
  end
end
