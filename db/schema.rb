# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_25_025630) do

  create_table "bosses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_bosses_on_email", unique: true
    t.index ["reset_password_token"], name: "index_bosses_on_reset_password_token", unique: true
  end

  create_table "child_tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "child_deadline"
    t.integer "possibility"
    t.integer "done"
    t.integer "result"
    t.integer "self_motivation"
    t.string "explanation"
    t.bigint "parent_task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "finish_time"
    t.index ["parent_task_id"], name: "index_child_tasks_on_parent_task_id"
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.bigint "boss_id", null: false
    t.index ["boss_id"], name: "index_organizations_on_boss_id"
    t.index ["team_id"], name: "index_organizations_on_team_id"
  end

  create_table "parent_tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "parent_deadline"
    t.integer "self_evaluate"
    t.string "explanation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_parent_tasks_on_user_id"
  end

  create_table "task_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "parent_comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "boss_id"
    t.bigint "child_task_id"
    t.bigint "user_id"
    t.bigint "parent_task_id"
    t.string "child_comment"
    t.index ["boss_id"], name: "index_task_comments_on_boss_id"
    t.index ["child_task_id"], name: "index_task_comments_on_child_task_id"
    t.index ["parent_task_id"], name: "index_task_comments_on_parent_task_id"
    t.index ["user_id"], name: "index_task_comments_on_user_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_missions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "parent_task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_task_id"], name: "index_user_missions_on_parent_task_id"
    t.index ["user_id"], name: "index_user_missions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.bigint "team_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "child_tasks", "parent_tasks"
  add_foreign_key "organizations", "bosses"
  add_foreign_key "organizations", "teams"
  add_foreign_key "parent_tasks", "users"
  add_foreign_key "task_comments", "bosses"
  add_foreign_key "task_comments", "child_tasks"
  add_foreign_key "task_comments", "parent_tasks"
  add_foreign_key "task_comments", "users"
  add_foreign_key "user_missions", "parent_tasks"
  add_foreign_key "user_missions", "users"
end
