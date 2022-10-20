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

ActiveRecord::Schema[7.0].define(version: 2022_10_19_203207) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true
  end

  create_table "params_remappings", force: :cascade do |t|
    t.bigint "route_id"
    t.string "initial_key"
    t.string "remapped_key"
    t.string "initial_value"
    t.string "remapped_value"
    t.index ["route_id"], name: "index_params_remappings_on_route_id"
  end

  create_table "request_settings", force: :cascade do |t|
    t.string "key", null: false
    t.string "value", null: false
    t.boolean "interpolated", default: false
    t.index ["key"], name: "index_request_settings_on_key", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.string "service_path", null: false
    t.string "service_http_method", null: false
    t.string "remote_method", null: false
    t.string "request_http_method", null: false
    t.boolean "disabled", default: false, null: false
    t.index ["service_path", "service_http_method"], name: "index_routes_on_service_path_and_service_http_method", unique: true
  end

end
