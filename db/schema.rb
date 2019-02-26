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

ActiveRecord::Schema.define(version: 2019_02_26_004439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repositories", force: :cascade do |t|
    t.integer "github_id"
    t.string "name"
    t.string "description"
    t.string "html_url"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repository_tags", force: :cascade do |t|
    t.bigint "repository_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["repository_id"], name: "index_repository_tags_on_repository_id"
    t.index ["tag_id"], name: "index_repository_tags_on_tag_id"
    t.index ["user_id"], name: "index_repository_tags_on_user_id"
  end

  create_table "repository_users", force: :cascade do |t|
    t.bigint "repository_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repository_id"], name: "index_repository_users_on_repository_id"
    t.index ["user_id"], name: "index_repository_users_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "repository_tags", "repositories"
  add_foreign_key "repository_tags", "tags"
  add_foreign_key "repository_tags", "users"
  add_foreign_key "repository_users", "repositories"
  add_foreign_key "repository_users", "users"
end
