class PayrollDatum < ApplicationRecord
  validates_presence_of :date, :hours_worked, :employee_id, :job_group
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      payroll_datum = new
      payroll_datum.attributes = row.to_hash
      payroll_datum.save!
    end
  end  
end
