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

ActiveRecord::Schema.define(version: 20140519123658) do

  create_table "client_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_types_clients", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "client_type_id"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "name_alternate"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "work_phone"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "fax_phone"
    t.string   "email"
    t.string   "address_alternate"
    t.string   "city_alternate"
    t.string   "state_alternate"
    t.string   "zip_alternate"
    t.string   "work_phone_alternate"
    t.string   "home_phone_alternate"
    t.string   "cell_phone_alternate"
    t.string   "fax_phone_alternate"
    t.string   "email_alternate"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "website"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_company_types", id: false, force: true do |t|
    t.integer "company_id"
    t.integer "company_type_id"
  end

  create_table "company_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faults", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "investigation_types", force: true do |t|
    t.string   "investigation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phases", force: true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.integer  "company_id"
    t.integer  "project_manager_id"
    t.string   "investigation_type_id"
    t.integer  "site_id"
    t.integer  "stakeholder_id"
    t.text     "description"
    t.date     "proposal_date"
    t.string   "proposal_number"
    t.date     "report_date"
    t.text     "notes"
    t.string   "insurance_policy_number"
    t.text     "insurance_notes"
    t.string   "bill_name"
    t.string   "bill_attention"
    t.string   "bill_address"
    t.string   "bill_city"
    t.string   "bill_state"
    t.string   "bill_zip"
    t.text     "bad_pay_history"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_managers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "manager_initials"
    t.string   "manager_firstname"
    t.string   "manager_lastname"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "name_alternate"
    t.string   "number"
    t.integer  "prefix"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "number"
    t.string   "address"
    t.string   "city"
    t.string   "county"
    t.text     "loc_page"
    t.decimal  "loc_longitude"
    t.decimal  "loc_latitude"
    t.string   "apn"
    t.string   "tombrobox"
    t.integer  "fault_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites_structure_types", id: false, force: true do |t|
    t.integer "site_id",           null: false
    t.integer "structure_type_id", null: false
  end

  add_index "sites_structure_types", ["site_id", "structure_type_id"], name: "index_sites_structure_types_on_site_id_and_structure_type_id"
  add_index "sites_structure_types", ["structure_type_id", "site_id"], name: "index_sites_structure_types_on_structure_type_id_and_site_id"

  create_table "stakeholder_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stakeholder_types_stakeholders", id: false, force: true do |t|
    t.integer "stakeholder_type_id", null: false
    t.integer "stakeholder_id",      null: false
  end

  add_index "stakeholder_types_stakeholders", ["stakeholder_id", "stakeholder_type_id"], name: "by_stake_stake_type", unique: true
  add_index "stakeholder_types_stakeholders", ["stakeholder_type_id", "stakeholder_id"], name: "by_stake_type_stake", unique: true

  create_table "stakeholders", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "work_phone"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "fax_phone"
    t.string   "email"
    t.string   "address_alternate"
    t.string   "city_alternate"
    t.string   "state_alternate"
    t.integer  "zip_alternate"
    t.string   "work_phone_alternate"
    t.string   "home_phone_alternate"
    t.string   "cell_phone_alternate"
    t.string   "fax_phone_alternate"
    t.string   "email_alternate"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "structure_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "locked",                 default: false, null: false
    t.string   "slug"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
