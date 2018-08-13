require 'test_helper'
include ActionDispatch::TestProcess

class WorkLogTest < ActiveSupport::TestCase
  test "valid work log" do
    work_log = WorkLog.new(date: Date.new(2018, -1), hours_worked: 3, employee_id: 2, upload_number: 1)
    work_log.valid?
  end

  test 'invalid without date' do
    work_log = WorkLog.new(hours_worked: 3, employee_id: 1, upload_number: 1)
    refute work_log.valid?, 'work log is valid without date'
    assert_not_nil work_log.errors[:name], 'no validation error for date present'
  end

  test 'invalid without hours_worked' do
    work_log = WorkLog.new(date: Date.today, employee_id: 1, upload_number: 1)
    refute work_log.valid?, 'work log is valid without hours worked'
    assert_not_nil work_log.errors[:name], 'no validation error for hours worked present'
  end

  test 'invalid without employee_id' do
    work_log = WorkLog.new(date: Date.today, hours_worked: 3, upload_number: 1)
    refute work_log.valid?, 'work log is valid without employee id'
    assert_not_nil work_log.errors[:name], 'no validation error for employee id present'
  end

  test 'invalid without upload_number' do
    work_log = WorkLog.new(date: Date.today, hours_worked: 3, employee_id: 1)
    refute work_log.valid?, 'work log is valid without upload number'
    assert_not_nil work_log.errors[:name], 'no validation error for upload number present'
  end
  
  test "Should not save a work log if one exists for the same employee and same date" do
    work_log1 = WorkLog.new(date: Date.today, hours_worked: 3, employee_id: 1, upload_number: 1)
    work_log1.save
    work_log2 = WorkLog.new(date: Date.today, hours_worked: 3, employee_id: 1, upload_number: 1)
    assert_not work_log2.save, "work log saved with the same employee id and date"
  end
  
  test "import work logs" do
    work_logs = WorkLog.where(upload_number: 43)
    assert_empty work_logs
    file = fixture_file_upload('storage/sample.csv', 'text/csv')
    WorkLog.import(file)
    work_logs = WorkLog.where(upload_number: 43)
    assert_equal 32, work_logs.count
    assert_equal 7.5, work_logs[0].hours_worked
    assert_equal 1, work_logs[0].employee_id
  end
end
