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

ActiveRecord::Schema.define(version: 20140728183542) do

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "groups", ["owner_id"], name: "index_groups_on_owner_id"

  create_table "targets", force: true do |t|
    t.string   "description"
    t.string   "outcome1"
    t.string   "outcome2"
    t.string   "final_outcome"
    t.string   "group_prediction"
    t.float    "confidence_level"
    t.float    "cr_divergence"
    t.float    "trials_cr_delta_mean"
    t.float    "trials_cr_delta_stddev"
    t.string   "trials_cr_delta_snr"
    t.float    "trials_zscore"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "owner_id"
  end

  add_index "targets", ["group_id"], name: "index_targets_on_group_id"
  add_index "targets", ["owner_id"], name: "index_targets_on_owner_id"

  create_table "trials", force: true do |t|
    t.string   "trn1"
    t.string   "trn2"
    t.float    "cr1"
    t.float    "cr2"
    t.integer  "solar_wind_speed"
    t.datetime "viewer_local_time"
    t.datetime "lst_time"
    t.string   "user_prediction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "target_id"
    t.integer  "user_id"
    t.integer  "owner_id"
  end

  add_index "trials", ["owner_id"], name: "index_trials_on_owner_id"
  add_index "trials", ["target_id"], name: "index_trials_on_target_id"
  add_index "trials", ["user_id"], name: "index_trials_on_user_id"

  create_table "users", force: true do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                default: "invited"
    t.datetime "key_timestamp"
    t.boolean  "projectmanager",                       default: false
  end

  add_index "users", ["state"], name: "index_users_on_state"

end
