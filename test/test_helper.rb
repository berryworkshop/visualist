require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# This will guess the User class
FactoryBot.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end

create_table "edges", force: :cascade do |t|
  t.bigint "subject_id"
  t.string "predicate"
  t.bigint "dobject_id"
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
  t.string "name"
  t.boolean "status"
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
