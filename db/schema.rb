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

ActiveRecord::Schema.define(version: 2021_02_05_020615) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "as_rentalequips", force: :cascade do |t|
    t.integer "equipment_id"
    t.integer "rental_equip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.integer "num"
    t.integer "rnum_id"
    t.index ["equipment_id"], name: "index_as_rentalequips_on_equipment_id"
    t.index ["rental_equip_id"], name: "index_as_rentalequips_on_rental_equip_id"
    t.index ["rnum_id"], name: "index_as_rentalequips_on_rnum_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "group"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "max_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "setumei"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "room"
    t.datetime "rental_at"
    t.datetime "return_at"
    t.string "g_name"
    t.string "r_name"
    t.string "tell"
    t.string "kyoka"
    t.string "kasidasi"
    t.string "henkyaku"
    t.string "youbousyo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "katudo_naiyo"
    t.string "email"
    t.integer "katudo_num"
  end

  create_table "gekkatus", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "month"
    t.string "file_name"
    t.binary "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hikitugis", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infomations", force: :cascade do |t|
    t.string "account"
    t.string "title"
    t.string "text"
    t.string "type"
    t.date "date"
    t.string "badgelist"
    t.text "done"
    t.string "pin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.string "classifi"
  end

  create_table "kyoyuhainotis", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notelists", force: :cascade do |t|
    t.string "parent"
    t.string "title"
    t.text "content"
    t.string "state"
    t.string "passset"
    t.string "dataset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "portalnavs", force: :cascade do |t|
    t.string "title"
    t.string "parent"
    t.string "child"
    t.string "group"
    t.string "check"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
  end

  create_table "portalnotegroups", force: :cascade do |t|
    t.string "groupone"
    t.string "grouptwo"
    t.string "groupthree"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "portaltexts", force: :cascade do |t|
    t.text "content"
    t.string "parent"
    t.string "check"
    t.string "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rental_equips", force: :cascade do |t|
    t.string "name"
    t.integer "r_num"
    t.datetime "rental_at"
    t.datetime "return_at"
    t.string "g_name"
    t.string "r_name"
    t.string "tell"
    t.string "no_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kyoka"
    t.string "kasidasi"
    t.string "henkyaku"
    t.string "youbousyo"
    t.string "setumei"
    t.integer "katudo_num"
    t.text "katudo_naiyo"
    t.string "email"
    t.string "place"
  end

  create_table "rnums", force: :cascade do |t|
    t.string "text"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secpasses", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token"
    t.string "logtype"
    t.string "macname"
    t.string "error"
    t.string "tell"
  end

  create_table "supports", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tell"
    t.text "text"
    t.string "g_name"
    t.datetime "time"
    t.string "cate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
