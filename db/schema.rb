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

ActiveRecord::Schema.define(version: 2023_06_01_074222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["department_id"], name: "index_affiliations_on_department_id"
    t.index ["user_id"], name: "index_affiliations_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_in_charges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_in_charges_on_client_id"
    t.index ["user_id"], name: "index_client_in_charges_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "negotiations", force: :cascade do |t|
    t.date "negotiate_at", null: false
    t.string "name", null: false
    t.integer "selling_price", null: false
    t.integer "wholesale_price", null: false
    t.text "product_image"
    t.text "explanation", null: false
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_negotiations_on_product_id"
    t.index ["user_id"], name: "index_negotiations_on_user_id"
  end

  create_table "product_in_charges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_in_charges_on_product_id"
    t.index ["user_id"], name: "index_product_in_charges_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "assumed_name", null: false
    t.integer "assumed_selling_price", null: false
    t.integer "assumed_wholesale_price", null: false
    t.date "start_on", null: false
    t.string "period", null: false
    t.integer "volume", null: false
    t.text "purpose", null: false
    t.text "concept", null: false
    t.text "reference_image"
    t.integer "status", default: 1, null: false
    t.bigint "client_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "application_status", default: 1, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["client_id"], name: "index_products_on_client_id"
  end

  create_table "results", force: :cascade do |t|
    t.text "content", null: false
    t.text "reference_image"
    t.bigint "user_id", null: false
    t.bigint "negotiation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["negotiation_id"], name: "index_results_on_negotiation_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "affiliations", "departments"
  add_foreign_key "affiliations", "users"
  add_foreign_key "client_in_charges", "clients"
  add_foreign_key "client_in_charges", "users"
  add_foreign_key "negotiations", "products"
  add_foreign_key "negotiations", "users"
  add_foreign_key "product_in_charges", "products"
  add_foreign_key "product_in_charges", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "clients"
  add_foreign_key "results", "negotiations"
  add_foreign_key "results", "users"
end
