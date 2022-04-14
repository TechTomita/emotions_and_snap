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

ActiveRecord::Schema.define(version: 2022_04_10_013036) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "snap_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["snap_id"], name: "index_comments_on_snap_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_relationships", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "snap_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["snap_id"], name: "index_favorite_relationships_on_snap_id"
    t.index ["user_id", "snap_id"], name: "index_favorite_relationships_on_user_id_and_snap_id", unique: true
    t.index ["user_id"], name: "index_favorite_relationships_on_user_id"
  end

  create_table "snaps", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_snaps_on_category_id"
    t.index ["user_id"], name: "index_snaps_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "snaps"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_relationships", "snaps"
  add_foreign_key "favorite_relationships", "users"
  add_foreign_key "snaps", "categories"
  add_foreign_key "snaps", "users"
end
