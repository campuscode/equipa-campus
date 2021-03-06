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

ActiveRecord::Schema.define(version: 20160921233944) do

  create_table "budgets", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.float    "acquisition_price"
    t.string   "delivery_address"
    t.string   "responsable"
    t.string   "cpf"
    t.integer  "rental_period"
    t.datetime "initial_date"
    t.float    "amount"
    t.float    "discount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "equipment_id"
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
    t.index ["equipment_id"], name: "index_contracts_on_equipment_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "billing_address"
    t.string   "email"
    t.string   "phone"
    t.string   "document"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "customer_type"
  end

  create_table "delivery_receipts", force: :cascade do |t|
    t.integer  "contract_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contract_id"], name: "index_delivery_receipts_on_contract_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "description"
    t.string   "serial_number"
    t.string   "asset_number"
    t.decimal  "acquisition_price"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "equipment_category_id"
    t.index ["equipment_category_id"], name: "index_equipment_on_equipment_category_id"
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "rental_period"
    t.decimal  "amount"
    t.integer  "equipment_category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["equipment_category_id"], name: "index_prices_on_equipment_category_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.integer  "contract_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contract_id"], name: "index_receipts_on_contract_id"
  end

  create_table "rented_equipments", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["contract_id"], name: "index_rented_equipments_on_contract_id"
    t.index ["equipment_id"], name: "index_rented_equipments_on_equipment_id"
  end

end
