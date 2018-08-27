# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_11_150952) do

  create_table "employees", force: :cascade do |t|
    t.string "job_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "pay_month"
    t.integer "pay_year"
    t.integer "pay_period"
    t.integer "employee_id"
    t.float "amount_paid", default: 0.0
    t.integer "upload_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_reports_on_employee_id"
  end

  create_table "work_logs", force: :cascade do |t|
    t.date "date"
    t.float "hours_worked"
    t.integer "upload_number"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_work_logs_on_employee_id"
  end

end
