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

ActiveRecord::Schema.define(version: 2022_03_03_143107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hobbies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hobby_tags", force: :cascade do |t|
    t.integer "hobby_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.bigint "first_user_id"
    t.bigint "second_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_user_id"], name: "index_inboxes_on_first_user_id"
    t.index ["second_user_id"], name: "index_inboxes_on_second_user_id"
  end

  create_table "letters", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "inbox_id"
    t.text "content"
    t.time "delivery_time"
    t.string "subject"
    t.boolean "bottled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inbox_id"], name: "index_letters_on_inbox_id"
    t.index ["receiver_id"], name: "index_letters_on_receiver_id"
    t.index ["sender_id"], name: "index_letters_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.integer "age"
    t.string "address"
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.text "avatar"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inboxes", "users", column: "first_user_id"
  add_foreign_key "inboxes", "users", column: "second_user_id"
  add_foreign_key "letters", "users", column: "receiver_id"
  add_foreign_key "letters", "users", column: "sender_id"
end
