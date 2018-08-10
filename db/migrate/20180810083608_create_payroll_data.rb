class CreatePayrollData < ActiveRecord::Migration[5.2]
  def change
    create_table :payroll_data do |t|
      t.date :date
      t.float :hours_worked
      t.integer :employee_id
      t.string :job_group

      t.timestamps
    end
  end
end
