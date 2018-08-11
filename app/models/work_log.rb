class WorkLog < ApplicationRecord
  belongs_to :employee
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)

    header = spreadsheet.row(1)
    header.collect! { |column_name|
      column_name == "date"? column_name : column_name.gsub!(" ", "_")
    }
    upload_number = spreadsheet.row(spreadsheet.last_row)[1]
    (2..spreadsheet.last_row - 1).each do |i|
      # payroll_report = PayrollReport.find_or_create_by(id: spreadsheet.row(i)[2])
      # PayrollDatum.import(header, spreadsheet.row(i), id)
    end
    # payroll_report.save!
  end
end
