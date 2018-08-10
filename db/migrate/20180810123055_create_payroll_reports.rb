class CreatePayrollReports < ActiveRecord::Migration[5.2]
  def change
    create_table :payroll_reports do |t|
      t.integer :employee_id
      t.string  :pay_period
      t.decimal :amount_paid                  
      t.timestamps
    end
  end
end
