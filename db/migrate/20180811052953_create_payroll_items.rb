class CreatePayrollItems < ActiveRecord::Migration[5.2]
  def change
    create_table :payroll_items do |t|
      t.integer :employee_id
      t.integer :pay_period, :default => 0
      t.decimal :amount_paid      
      t.integer :year
      t.integer :month
      t.timestamps
    end
  end
end
