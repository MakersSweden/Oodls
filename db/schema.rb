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

ActiveRecord::Schema.define(version: 20150603150312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: true do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "average_caches", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charities", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "postcode"
    t.text     "organisation"
    t.text     "contact_name"
    t.text     "full_address"
    t.text     "description"
    t.string   "dried_goods"
    t.string   "snacks"
    t.string   "cooking_ingredients"
    t.string   "drinks"
    t.string   "uht_milk"
    t.string   "cereals"
    t.string   "tins",                   default: "0"
    t.text     "website_url"
    t.string   "coffee_and_tea"
    t.string   "fresh_fruit_and_veg"
    t.string   "fresh_meat_and_fish"
    t.string   "jars_and_condiments"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "weekend_opening_hours"
    t.text     "weekday_opening_hours"
  end

  add_index "charities", ["email"], name: "index_charities_on_email", unique: true, using: :btree
  add_index "charities", ["reset_password_token"], name: "index_charities_on_reset_password_token", unique: true, using: :btree

  create_table "donation_claims", force: true do |t|
    t.integer  "charity_id"
    t.integer  "donation_id"
    t.text     "comment"
    t.date     "pick_up_date"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donation_claims", ["charity_id"], name: "index_donation_claims_on_charity_id", using: :btree
  add_index "donation_claims", ["donation_id"], name: "index_donation_claims_on_donation_id", using: :btree

  create_table "donations", force: true do |t|
    t.integer  "donor_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "will_deliver", default: false
    t.date     "from_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donations", ["donor_id"], name: "index_donations_on_donor_id", using: :btree

  create_table "donor_comments", force: true do |t|
    t.integer  "charity_id"
    t.integer  "donor_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donor_comments", ["charity_id"], name: "index_donor_comments_on_charity_id", using: :btree
  add_index "donor_comments", ["donor_id"], name: "index_donor_comments_on_donor_id", using: :btree

  create_table "donors", force: true do |t|
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
    t.string   "firstname",              default: "", null: false
    t.string   "surname",                default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organisation"
    t.string   "description"
    t.string   "postcode"
    t.string   "full_address"
    t.string   "website_url"
    t.string   "contact_name"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "donors", ["email"], name: "index_donors_on_email", unique: true, using: :btree
  add_index "donors", ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true, using: :btree

  create_table "overall_averages", force: true do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

end
