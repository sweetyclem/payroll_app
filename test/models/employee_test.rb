require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "valid employee" do
    employee = Employee.new(id: 5, job_group: "A")
    employee.valid?
  end

  test 'invalid without job group' do
    employee = Employee.new(id: 4)
    refute employee.valid?, 'employee is valid without job group'
    assert_not_nil employee.errors[:name], 'no validation error for job group present'
  end
end
