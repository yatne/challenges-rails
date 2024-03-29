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

ActiveRecord::Schema[7.1].define(version: 2024_02_12_141630) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "challenge_participations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_participations_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_participations_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.string "invite_token"
    t.boolean "is_solo"
    t.decimal "goal"
    t.index ["creator_id"], name: "index_challenges_on_creator_id"
    t.index ["invite_token"], name: "index_challenges_on_invite_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.bigint "entry_type_id", null: false
    t.float "value"
    t.date "date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_entries_on_challenge_id"
    t.index ["entry_type_id"], name: "index_entries_on_entry_type_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "entry_types", force: :cascade do |t|
    t.bigint "challenge_id", null: false
    t.string "name"
    t.string "units"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_entry_types_on_challenge_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "challenge_participations", "challenges"
  add_foreign_key "challenge_participations", "users"
  add_foreign_key "challenges", "users", column: "creator_id"
  add_foreign_key "entries", "challenges"
  add_foreign_key "entries", "entry_types"
  add_foreign_key "entries", "users"
  add_foreign_key "entry_types", "challenges"
  add_foreign_key "profiles", "users"
end
