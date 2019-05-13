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

ActiveRecord::Schema.define(version: 2019_04_29_105803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_forms", force: :cascade do |t|
    t.string "email"
    t.text "description"
    t.bigint "visitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_id"], name: "index_contact_forms_on_visitor_id"
  end

  create_table "financers", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formularies", force: :cascade do |t|
    t.bigint "visitor_id"
    t.bigint "project_id"
    t.string "first_name"
    t.string "zip_code"
    t.string "age"
    t.integer "is_working"
    t.integer "loss_of_autonomy_receipt"
    t.integer "occupation"
    t.integer "holder_occupation"
    t.string "lessor"
    t.integer "accommodation"
    t.integer "floor"
    t.integer "accessibility_with_step"
    t.integer "type_of_pension"
    t.string "pension"
    t.string "supplementary"
    t.integer "loss_of_autonomy"
    t.integer "occupant"
    t.integer "owner_is_include"
    t.integer "has_partner"
    t.integer "tax_revenue"
    t.integer "gross_income"
    t.integer "global_tax_revenue"
    t.integer "household_income"
    t.integer "owner_tax_revenue"
    t.string "assistant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_formularies_on_project_id"
    t.index ["visitor_id"], name: "index_formularies_on_visitor_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string "background"
    t.string "category"
    t.string "group"
    t.string "name"
    t.string "conditions"
    t.text "answers"
    t.bigint "financer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financer_id"], name: "index_solutions_on_financer_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.boolean "client", default: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "phone"
    t.string "avatar"
    t.boolean "advisor", default: false
    t.boolean "client", default: false
    t.boolean "admin", default: false
    t.boolean "agreed", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "user_ip"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_visitors_on_user_id"
  end

  add_foreign_key "contact_forms", "visitors"
  add_foreign_key "formularies", "projects"
  add_foreign_key "formularies", "visitors"
  add_foreign_key "solutions", "financers"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
  add_foreign_key "visitors", "users"
end
