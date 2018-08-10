class PayrollDatum < ApplicationRecord
  belongs_to :payroll_report
  validates_presence_of :date, :hours_worked, :employee_id, :job_group, :payroll_report_id
  validates :date, uniqueness: { scope: :employee_id }
  
  def self.import header, row, report_id
    row = Hash[[header, row].transpose]
      payroll_datum = new
      payroll_datum.attributes = row.to_hash
      payroll_datum.payroll_report_id = report_id
      payroll_datum.save!
  end
end
