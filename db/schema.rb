# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_21_193025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cpf"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_clients_on_cpf", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cnpj"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cnpj"], name: "index_companies_on_cnpj", unique: true
    t.index ["email"], name: "index_companies_on_email", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "client_id", null: false
    t.string "title"
    t.string "status"
    t.text "description"
    t.decimal "discount_percentage"
    t.decimal "discount_amount"
    t.decimal "tax_percentage"
    t.decimal "tax_amount"
    t.date "due_date"
    t.decimal "sub_total"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["company_id"], name: "index_invoices_on_company_id"
  end

  add_foreign_key "invoices", "clients"
  add_foreign_key "invoices", "companies"
end
