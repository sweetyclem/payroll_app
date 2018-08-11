class CreatePayrollReports < ActiveRecord::Migration[5.2]
  def change
    create_table :payroll_reports do |t|                 
      t.timestamps
    end
  end
end
