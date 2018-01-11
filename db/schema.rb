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

  create_table "citations", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "url"
    t.string "citeable_type"
    t.bigint "citeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citeable_type", "citeable_id"], name: "index_citations_on_citeable_type_and_citeable_id"
  end

  create_table "connections", force: :cascade do |t|
    t.string "subjectable_type"
    t.bigint "subjectable_id"
    t.string "predicate"
    t.string "dobjectable_type"
    t.bigint "dobjectable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dobjectable_type", "dobjectable_id"], name: "index_connections_on_dobjectable_type_and_dobjectable_id"
    t.index ["subjectable_type", "subjectable_id"], name: "index_connections_on_subjectable_type_and_subjectable_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "label"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "categories"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flags", force: :cascade do |t|
    t.boolean "is_featured"
    t.boolean "is_approved"
    t.boolean "is_public"
    t.string "flaggable_type"
    t.bigint "flaggable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flaggable_type", "flaggable_id"], name: "index_flags_on_flaggable_type_and_flaggable_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.string "url"
    t.string "aspect"
    t.string "checksum"
    t.bigint "source_id"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
    t.index ["source_id"], name: "index_images_on_source_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "licenseable_type"
    t.bigint "licenseable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["licenseable_type", "licenseable_id"], name: "index_licenses_on_licenseable_type_and_licenseable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "latitude", precision: 8, scale: 5
    t.decimal "longitude", precision: 8, scale: 5
    t.string "street"
    t.string "locality"
    t.bigint "region_id"
    t.bigint "country_id"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.index ["country_id"], name: "index_locations_on_country_id"
    t.index ["latitude"], name: "index_locations_on_latitude"
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
    t.index ["longitude"], name: "index_locations_on_longitude"
    t.index ["region_id"], name: "index_locations_on_region_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_pages_on_parent_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name_given"
    t.string "name_family"
    t.string "name_prefix"
    t.string "name_suffix"
    t.text "body"
    t.string "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "label"
    t.integer "country_code"
    t.integer "area_code"
    t.integer "exchange_code"
    t.integer "number"
    t.string "extension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snippets", force: :cascade do |t|
    t.string "value"
    t.bigint "source_id"
    t.string "snippetable_type"
    t.bigint "snippetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snippetable_type", "snippetable_id"], name: "index_snippets_on_snippetable_type_and_snippetable_id"
    t.index ["source_id"], name: "index_snippets_on_source_id"
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string "label"
    t.string "service"
    t.string "account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string "type"
    t.string "value"
    t.string "vocabulary"
    t.string "remote_id"
    t.string "remote_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_periods", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer "duration"
    t.integer "precision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timelineable_type"
    t.bigint "timelineable_id"
    t.index ["end"], name: "index_time_periods_on_end"
    t.index ["start"], name: "index_time_periods_on_start"
    t.index ["timelineable_type", "timelineable_id"], name: "index_time_periods_on_timelineable_type_and_timelineable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "websites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
