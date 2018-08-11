class PayrollItem < ApplicationRecord
  belongs_to :payroll_report
  validates :pay_period, uniqueness: { scope: :employee_id }
end
