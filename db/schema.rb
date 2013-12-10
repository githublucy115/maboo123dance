# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131209195241) do

  create_table "classrecords", force: true do |t|
    t.decimal  "cost"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrecords_students", force: true do |t|
    t.integer "classrecord_id"
    t.integer "student_id"
  end

  add_index "classrecords_students", ["classrecord_id"], name: "index_classrecords_students_on_classrecord_id"
  add_index "classrecords_students", ["student_id"], name: "index_classrecords_students_on_student_id"

  create_table "expenses", force: true do |t|
    t.integer  "student_id"
    t.integer  "classrecord_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["student_id"], name: "index_expenses_on_student_id"

  create_table "payments", force: true do |t|
    t.integer  "expense_id"
    t.decimal  "amount"
    t.string   "payment_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["expense_id"], name: "index_payments_on_expense_id"

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "balance"
    t.integer  "credit"
    t.string   "signature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "student_id"
    t.integer  "classrecord_id"
    t.decimal  "amount"
    t.integer  "credit"
    t.string   "payment_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
