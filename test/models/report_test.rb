require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "generates a report" do
    employee = Employee.new(id: 6, job_group: "A")
    employee.save!
    work_log = WorkLog.new(date: Date.new(2018,7,30), hours_worked: 3, employee_id: 6, upload_number: 3)
    work_log.save!
    Report.generate([6], 3)
    report = Report.find_by(employee_id: 6)
    assert_not_nil report
    assert_equal 2, report.pay_period
    assert_equal 60, report.amount_paid
  end
end
