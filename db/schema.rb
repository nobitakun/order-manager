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

ActiveRecord::Schema.define(version: 20180508090148) do

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "line_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_item_id"], name: "index_carts_on_line_item_id"
    t.index ["order_id", "line_item_id"], name: "index_carts_on_order_id_and_line_item_id", unique: true
    t.index ["order_id"], name: "index_carts_on_order_id"
  end

  create_table "item_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "unit"
    t.bigint "item_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "kana"
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quantity"
    t.string "delivery_date"
    t.string "remark"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paid"
    t.bigint "order_list_id"
    t.integer "unit_price"
    t.bigint "partner_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
    t.index ["order_list_id"], name: "index_line_items_on_order_list_id"
    t.index ["partner_id"], name: "index_line_items_on_partner_id"
  end

  create_table "order_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_order_lists_on_project_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "document_date"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "destination"
    t.string "staff"
    t.string "remark"
    t.integer "discount"
    t.index ["project_id"], name: "index_orders_on_project_id"
  end

  create_table "partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "postal_code"
    t.string "adress"
    t.string "phone"
    t.string "fax"
    t.string "staff"
    t.string "staff_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kana"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "current_postal_code"
    t.string "postal_code"
    t.string "current_adress"
    t.string "adress"
    t.string "current_phone"
    t.string "phone"
    t.string "owner_phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remark"
    t.integer "recipt"
    t.string "code"
    t.string "contract_date"
    t.string "finish_date"
    t.string "mrs_phone"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.boolean "root"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carts", "line_items"
  add_foreign_key "carts", "orders"
  add_foreign_key "items", "item_categories"
  add_foreign_key "line_items", "items"
  add_foreign_key "line_items", "order_lists"
  add_foreign_key "line_items", "partners"
  add_foreign_key "order_lists", "projects"
  add_foreign_key "orders", "projects"
  add_foreign_key "projects", "users"
end
