class WorkLog < ApplicationRecord
  belongs_to :employee
  validates :date, uniqueness: { scope: :employee_id }
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    header.collect! { |column_name|
      column_name == "date"? column_name : column_name.gsub!(" ", "_")
    }
    upload_number = Integer(spreadsheet.row(spreadsheet.last_row)[1])
    raise Exception.new("Upload number already exists") if !WorkLog.where(upload_number: upload_number).empty?
    
    employee_ids = []
    
    (2..spreadsheet.last_row - 1).each do |i|
      employee = Employee.find_or_create_by(id: spreadsheet.row(i)[2])
      employee.job_group = spreadsheet.row(i)[3]
      employee.save!
      work_log = new
      work_log.employee_id = Integer(spreadsheet.row(i)[2])
      work_log.date = Date.parse(spreadsheet.row(i)[0])
      work_log.hours_worked = Float(spreadsheet.row(i)[1])
      work_log.upload_number = upload_number
      work_log.save!
      employee_ids.push(spreadsheet.row(i)[2])
    end
    return employee_ids.uniq, upload_number
  end
end
