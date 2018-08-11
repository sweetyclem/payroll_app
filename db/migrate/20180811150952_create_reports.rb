class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :pay_month
      t.integer :pay_year
      t.integer :pay_period
      t.references :employee, foreign_key: true
      t.decimal :amount_paid
      t.integer :upload_number

      t.timestamps
    end
  end
end
