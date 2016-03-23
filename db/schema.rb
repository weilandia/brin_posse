ActiveRecord::Schema.define(version: 20160323025007) do

  enable_extension "plpgsql"

  create_table "pairing_sessions", force: :cascade do |t|
    t.integer  "complete",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_pairings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pairing_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "user_pairings", ["pairing_session_id"], name: "index_user_pairings_on_pairing_session_id", using: :btree
  add_index "user_pairings", ["user_id"], name: "index_user_pairings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "github"
    t.string   "cohort"
    t.integer  "ruby_exercisms"
    t.integer  "js_exercisms"
    t.integer  "all_exercisms"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "user_pairings", "pairing_sessions"
  add_foreign_key "user_pairings", "users"
end
