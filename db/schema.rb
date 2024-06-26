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

ActiveRecord::Schema[7.0].define(version: 2024_05_02_092532) do
  create_table "diaries", charset: "utf8", force: :cascade do |t|
    t.date "entry_date", null: false
    t.float "current_weight", null: false
    t.float "weight_difference"
    t.float "plus_calories"
    t.float "minus_calories"
    t.float "calorie_balance"
    t.float "current_BFP"
    t.text "diary_comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.integer "biological_sex_id"
    t.date "birth_date"
    t.integer "age"
    t.date "start_date"
    t.float "height", null: false
    t.float "starting_weight"
    t.float "appropriate_weight"
    t.float "BMI"
    t.float "starting_BFP"
    t.float "term_goal"
    t.text "comment"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diaries", "users"
end
