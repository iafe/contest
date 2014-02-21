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

ActiveRecord::Schema.define(version: 20140218205427) do

  create_table "awards", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "rules"
    t.string   "sponsor"
    t.string   "sponsor_logo"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "award_id"
    t.integer  "document_max_number"
    t.integer  "photo_max_number"
    t.integer  "video_max_number"
    t.integer  "max_total_file_size"
    t.text     "description"
    t.text     "rules"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_max_number"
    t.string   "submission_file_type"
  end

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.integer  "division_smallest"
    t.integer  "division_largest"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "judges", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_details", force: true do |t|
    t.integer  "organization_id"
    t.date     "fair_start_date"
    t.date     "fair_end_date"
    t.integer  "total_attendance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "primary_contact"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state_province"
    t.string   "country"
    t.string   "zip_code"
    t.string   "phone"
    t.boolean  "fair"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["name", "state_province"], name: "index_organizations_on_name_and_state_province", unique: true

  create_table "score_details", force: true do |t|
    t.integer  "score_id"
    t.integer  "points"
    t.integer  "score_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "score_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "max_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.integer  "total_score"
    t.text     "comments"
    t.boolean  "disqualify"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submission_details", force: true do |t|
    t.integer  "submission_id"
    t.string   "file_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "division_id"
    t.integer  "contest_year"
    t.text     "notes"
    t.boolean  "physical_version_received"
    t.boolean  "digital_version_received"
    t.boolean  "disqualify"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "submissions", ["organization_id", "category_id", "contest_year"], name: "index_submissions_on_organization_id", unique: true

  create_table "user_organizations", force: true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.boolean  "primary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.boolean  "admin"
    t.boolean  "judge"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
