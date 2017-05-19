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

ActiveRecord::Schema.define(version: 20170519184754) do

  create_table "groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "groups_permissions", id: false, force: :cascade do |t|
    t.integer "permission_id", null: false
    t.integer "group_id",      null: false
    t.index ["permission_id", "group_id"], name: "index_groups_permissions_on_permission_id_and_group_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "name"
  end

  create_table "permissions_subjects", id: false, force: :cascade do |t|
    t.integer "permission_id", null: false
    t.integer "subject_id",    null: false
    t.index ["permission_id", "subject_id"], name: "index_permissions_subjects_on_permission_id_and_subject_id"
  end

  create_table "permissions_users", id: false, force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
    t.index ["user_id", "permission_id"], name: "index_permissions_users_on_user_id_and_permission_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
