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

ActiveRecord::Schema[7.0].define(version: 2023_07_28_090733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classes_users", id: false, force: :cascade do |t|
    t.bigint "class_id", null: false
    t.bigint "user_id", null: false
    t.float "gpa"
    t.index ["class_id", "user_id"], name: "index_classes_users_on_class_id_and_user_id", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_id", null: false
    t.index ["class_id"], name: "index_schedules_on_class_id"
    t.index ["subject_id", "class_id"], name: "index_schedules_on_subject_id_and_class_id", unique: true
    t.index ["subject_id"], name: "index_schedules_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_id"
    t.index ["class_id"], name: "index_users_on_class_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "schedules", "classes"
  add_foreign_key "schedules", "subjects"
  add_foreign_key "users", "classes"
  add_foreign_key "users", "roles"
end
