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

ActiveRecord::Schema.define(version: 20180312171906) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_manages", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_relationships", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "project_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "sales_name"
    t.string "sbu"
    t.boolean "disable_workflow", default: false
    t.integer "cost_plan"
    t.integer "cost_already"
    t.string "project_class"
    t.string "customer_company"
    t.string "customer_name"
    t.string "customer_phone"
    t.string "pm_name"
    t.string "area"
    t.string "project_start_time"
    t.string "project_end_time"
    t.string "submit_plan"
    t.string "other"
    t.boolean "is_temp", default: false
    t.string "following_sbu"
  end

  create_table "sbu_leaders", force: :cascade do |t|
    t.integer "sbu_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sbus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sbus_on_name", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_relationships", force: :cascade do |t|
    t.integer "father_id"
    t.integer "son_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_company_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_leader_units", force: :cascade do |t|
    t.integer "user_id"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skill_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "itcode"
    t.string "code"
    t.string "name"
    t.integer "sbu_id"
    t.string "phone"
    t.string "title"
    t.string "level"
    t.integer "cost"
    t.string "sbu_name"
    t.string "area"
    t.string "status"
    t.string "job_class"
    t.boolean "pm", default: false
    t.string "costcenter"
    t.boolean "is_logined", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["itcode"], name: "index_users_on_itcode", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeklies", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "weekly_template_id"
  end

  create_table "weekly_templates", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflow_company_relationships", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflow_skill_relationships", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflow_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflows", force: :cascade do |t|
    t.text "description"
    t.float "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "user_id"
    t.string "aasm_state", default: "processing"
    t.integer "weekly_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "remaining_issue"
    t.integer "workflow_type_id"
    t.string "other_skill"
    t.string "other_company"
    t.string "project_sales"
    t.float "cost"
    t.integer "unit_id"
    t.string "project_name"
    t.integer "project_unit"
    t.index ["aasm_state"], name: "index_workflows_on_aasm_state"
  end

end
