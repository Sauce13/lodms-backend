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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_232305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_instructors", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "instructor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_instructors_on_course_id"
    t.index ["instructor_id", "course_id"], name: "index_course_instructors_on_instructor_id_and_course_id", unique: true
    t.index ["instructor_id"], name: "index_course_instructors_on_instructor_id"
  end

  create_table "course_performance_indicators", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "performance_indicator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_performance_indicators_on_course_id"
    t.index ["performance_indicator_id"], name: "idx_on_performance_indicator_id_24acd08164"
  end

  create_table "course_students", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_students_on_course_id"
    t.index ["student_id", "course_id"], name: "index_course_students_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_course_students_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "crn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "department_level_learning_outcomes", force: :cascade do |t|
    t.text "outcome_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_department_level_learning_outcomes_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_instructors_on_department_id"
  end

  create_table "performance_indicators", force: :cascade do |t|
    t.text "indicator_Description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_program_admins_on_department_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_instructors", "courses"
  add_foreign_key "course_instructors", "instructors"
  add_foreign_key "course_performance_indicators", "courses"
  add_foreign_key "course_performance_indicators", "performance_indicators"
  add_foreign_key "course_students", "courses"
  add_foreign_key "course_students", "students"
  add_foreign_key "department_level_learning_outcomes", "departments"
  add_foreign_key "instructors", "departments"
  add_foreign_key "program_admins", "departments"
end
