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

ActiveRecord::Schema.define(version: 20180105220241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "edges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.string "predicate"
    t.bigint "dobject_id"
    t.index ["dobject_id"], name: "index_edges_on_dobject_id"
    t.index ["subject_id", "predicate", "dobject_id"], name: "index_edges_on_subject_id_and_predicate_and_dobject_id", unique: true
    t.index ["subject_id"], name: "index_edges_on_subject_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.text "categories", default: [], array: true
    t.bigint "user_id"
    t.boolean "is_active"
    t.boolean "is_approved"
    t.boolean "is_featured", default: false
    t.boolean "is_public", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories"], name: "index_nodes_on_categories"
    t.index ["type"], name: "index_nodes_on_type"
    t.index ["user_id"], name: "index_nodes_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
