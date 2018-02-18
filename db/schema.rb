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

ActiveRecord::Schema.define(version: 20180110042014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associations", force: :cascade do |t|
    t.bigint "subject_id"
    t.string "predicate"
    t.bigint "dobject_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dobject_id"], name: "index_associations_on_dobject_id"
    t.index ["subject_id"], name: "index_associations_on_subject_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "address"
    t.bigint "record_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_emails_on_record_id"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "latitude", precision: 8, scale: 5
    t.decimal "longitude", precision: 8, scale: 5
    t.text "address"
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "mime_type"
    t.string "checksum"
    t.string "url"
    t.string "mediable_type"
    t.bigint "mediable_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mediable_type", "mediable_id"], name: "index_media_on_mediable_type_and_mediable_id"
  end

  create_table "periods", force: :cascade do |t|
    t.datetime "start"
    t.string "start_precision"
    t.datetime "end"
    t.string "end_precision"
    t.string "timeable_type"
    t.bigint "timeable_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeable_type", "timeable_id"], name: "index_periods_on_timeable_type_and_timeable_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.bigint "record_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_phones_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.text "body"
    t.bigint "user_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "socials", force: :cascade do |t|
    t.string "account"
    t.string "system"
    t.bigint "record_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_socials_on_record_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "parent_id", default: 0
    t.string "term"
    t.string "vocabulary", default: "visualist"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_tags_on_parent_id"
    t.index ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "ownable_type"
    t.bigint "ownable_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_users_on_ownable_type_and_ownable_id"
  end

  create_table "websites", force: :cascade do |t|
    t.string "url"
    t.bigint "record_id"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_websites_on_record_id"
  end

end
