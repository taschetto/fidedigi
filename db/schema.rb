# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150603003220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.date     "accessed_at"
    t.integer  "access_count"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "accesses", ["accessed_at"], name: "index_accesses_on_accessed_at", using: :btree

  create_table "clerks", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "clerks", ["company_id"], name: "index_clerks_on_company_id", using: :btree
  add_index "clerks", ["email"], name: "index_clerks_on_email", unique: true, using: :btree
  add_index "clerks", ["reset_password_token"], name: "index_clerks_on_reset_password_token", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "ratio"
    t.integer  "manager_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "minimum_value"
  end

  add_index "companies", ["manager_id"], name: "index_companies_on_manager_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.boolean  "redeemed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "coupons", ["promotion_id"], name: "index_coupons_on_promotion_id", using: :btree
  add_index "coupons", ["user_id"], name: "index_coupons_on_user_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree

  create_table "points", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "balance"
    t.date     "expiration"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "points", ["company_id"], name: "index_points_on_company_id", using: :btree
  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.integer  "company_id"
    t.date     "expiration"
    t.integer  "value"
    t.integer  "availability"
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "promotions", ["company_id"], name: "index_promotions_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vouchers", force: :cascade do |t|
    t.string   "code"
    t.integer  "company_id"
    t.date     "expiration"
    t.decimal  "monetary_value"
    t.integer  "points"
    t.boolean  "redeemed"
    t.integer  "clerk_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "point_id"
  end

  add_index "vouchers", ["clerk_id"], name: "index_vouchers_on_clerk_id", using: :btree
  add_index "vouchers", ["company_id"], name: "index_vouchers_on_company_id", using: :btree
  add_index "vouchers", ["point_id"], name: "index_vouchers_on_point_id", using: :btree

  add_foreign_key "clerks", "companies"
  add_foreign_key "companies", "managers"
  add_foreign_key "coupons", "promotions"
  add_foreign_key "coupons", "users"
  add_foreign_key "points", "companies"
  add_foreign_key "points", "users"
  add_foreign_key "promotions", "companies"
  add_foreign_key "vouchers", "clerks"
  add_foreign_key "vouchers", "companies"
  add_foreign_key "vouchers", "points"
end
