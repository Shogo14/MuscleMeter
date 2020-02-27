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

ActiveRecord::Schema.define(version: 2020_02_22_142838) do

  create_table "body_parts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "training_type_id"
    t.bigint "body_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_part_id", "created_at"], name: "index_training_menus_on_body_part_id_and_created_at"
    t.index ["body_part_id"], name: "index_training_menus_on_body_part_id"
    t.index ["name", "body_part_id"], name: "index_training_menus_on_name_and_body_part_id", unique: true
    t.index ["name", "training_type_id"], name: "index_training_menus_on_name_and_training_type_id", unique: true
    t.index ["training_type_id", "created_at"], name: "index_training_menus_on_training_type_id_and_created_at"
    t.index ["training_type_id"], name: "index_training_menus_on_training_type_id"
  end

  create_table "training_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "work_outs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "training_date"
    t.bigint "user_id"
    t.bigint "training_menu_id"
    t.float "weight"
    t.integer "rep"
    t.integer "set"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_date", "user_id", "training_menu_id", "weight"], name: "one_user_work_out_unique_index", unique: true
    t.index ["training_menu_id"], name: "index_work_outs_on_training_menu_id"
    t.index ["user_id"], name: "index_work_outs_on_user_id"
  end

  add_foreign_key "training_menus", "body_parts"
  add_foreign_key "training_menus", "training_types"
  add_foreign_key "work_outs", "training_menus"
  add_foreign_key "work_outs", "users"
end
