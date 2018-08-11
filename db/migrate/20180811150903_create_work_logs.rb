class CreateWorkLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :work_logs do |t|
      t.date :date
      t.decimal :hours_worked
      t.integer :upload_number
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
