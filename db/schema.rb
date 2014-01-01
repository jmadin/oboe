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

ActiveRecord::Schema.define(version: 20131230204156) do

  create_table "contexts", force: true do |t|
    t.integer  "project_id"
    t.integer  "observation_id"
    t.integer  "has_context_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contexts", ["has_context_id"], name: "index_contexts_on_has_context_id"
  add_index "contexts", ["observation_id"], name: "index_contexts_on_observation_id"
  add_index "contexts", ["project_id"], name: "index_contexts_on_project_id"

  create_table "entities", force: true do |t|
    t.string   "entity_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", force: true do |t|
    t.integer  "observation_id"
    t.integer  "trait_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "standard_id"
  end

  add_index "measurements", ["observation_id"], name: "index_measurements_on_observation_id"
  add_index "measurements", ["standard_id"], name: "index_measurements_on_standard_id"
  add_index "measurements", ["trait_id"], name: "index_measurements_on_trait_id"

  create_table "observations", force: true do |t|
    t.integer  "project_id"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observations", ["entity_id"], name: "index_observations_on_entity_id"
  add_index "observations", ["project_id"], name: "index_observations_on_project_id"

  create_table "points", force: true do |t|
    t.integer  "row_id"
    t.integer  "measurement_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["measurement_id"], name: "index_points_on_measurement_id"
  add_index "points", ["row_id"], name: "index_points_on_row_id"

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id", "created_at"], name: "index_projects_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "rows", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rows", ["project_id"], name: "index_rows_on_project_id"

  create_table "standards", force: true do |t|
    t.string   "standard_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "traits", force: true do |t|
    t.string   "trait_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
