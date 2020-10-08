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

ActiveRecord::Schema.define(version: 2020_10_08_220608) do

  create_table "base_stations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "serial_number", null: false
    t.boolean "active", default: true
    t.text "encryption_key"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_base_stations_on_organization_id"
  end

  create_table "cte_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cte_id"
    t.integer "dataset_number"
    t.string "file_name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cte_id"], name: "index_cte_data_on_cte_id"
  end

  create_table "cte_dexes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cte_id"
    t.string "file_name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cte_id"], name: "index_cte_dexes_on_cte_id"
  end

  create_table "cte_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cte_id"
    t.string "file_name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cte_id"], name: "index_cte_logs_on_cte_id"
  end

  create_table "ctes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "radio_id"
    t.string "serial_number"
    t.text "encryption_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ctes_patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cte_id"
    t.bigint "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cte_id"], name: "index_ctes_patients_on_cte_id"
    t.index ["patient_id"], name: "index_ctes_patients_on_patient_id"
  end

  create_table "delayed_jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "firmwares", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "kind", null: false
    t.integer "major", null: false
    t.integer "minor", null: false
    t.integer "bugfix", null: false
    t.integer "build", null: false
    t.boolean "critical", null: false
    t.text "file", size: :medium, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "text"
    t.integer "level"
    t.datetime "expires_at"
    t.boolean "in_app"
    t.boolean "email"
    t.boolean "sms"
    t.string "action"
    t.string "href"
    t.integer "duration"
  end

  create_table "notifications_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "notification_id"
    t.bigint "user_id"
    t.datetime "acknowledged_at"
    t.index ["notification_id"], name: "index_notifications_users_on_notification_id"
    t.index ["user_id"], name: "index_notifications_users_on_user_id"
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "kind", default: 0
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "phone1"
    t.string "phone2"
    t.string "phone3"
    t.string "email1"
    t.string "email2"
    t.string "email3"
    t.boolean "active"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["depth"], name: "index_organizations_on_depth"
    t.index ["lft"], name: "index_organizations_on_lft"
    t.index ["name"], name: "index_organizations_on_name"
    t.index ["parent_id"], name: "index_organizations_on_parent_id"
    t.index ["rgt"], name: "index_organizations_on_rgt"
  end

  create_table "organizations_test_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "test_plan_id", null: false
    t.index ["organization_id"], name: "index_organizations_test_plans_on_organization_id"
    t.index ["test_plan_id"], name: "index_organizations_test_plans_on_test_plan_id"
  end

  create_table "organizations_tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "test_id", null: false
    t.index ["organization_id"], name: "index_organizations_tests_on_organization_id"
    t.index ["test_id"], name: "index_organizations_tests_on_test_id"
  end

  create_table "organizations_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.index ["organization_id"], name: "index_organizations_users_on_organization_id"
    t.index ["user_id"], name: "index_organizations_users_on_user_id"
  end

  create_table "patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.datetime "dob"
    t.datetime "surgery_date"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_patients_on_organization_id"
  end

  create_table "patients_test_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "test_plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_patients_test_plans_on_patient_id"
    t.index ["test_plan_id"], name: "index_patients_test_plans_on_test_plan_id"
  end

  create_table "patients_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "user_id"
    t.index ["patient_id"], name: "index_patients_users_on_patient_id"
    t.index ["user_id"], name: "index_patients_users_on_user_id"
  end

  create_table "test_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_plans_tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.bigint "test_plan_id", null: false
    t.integer "duration", null: false
    t.boolean "high_res", default: false, null: false
    t.index ["test_id"], name: "index_test_plans_tests_on_test_id"
    t.index ["test_plan_id"], name: "index_test_plans_tests_on_test_plan_id"
  end

  create_table "test_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "patients_test_plan_id"
    t.datetime "start_time"
    t.integer "dataset_number"
    t.integer "status"
    t.text "notes"
    t.index ["patients_test_plan_id"], name: "index_test_results_on_patients_test_plan_id"
  end

  create_table "tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "password_digest", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "nickname"
    t.string "image"
    t.string "email", null: false
    t.integer "role", default: 100
    t.datetime "tac_agreed_at"
    t.string "unsubscribe_token"
    t.datetime "unsubscribed_at"
    t.datetime "password_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.integer "item_id", null: false
    t.string "item_subtype"
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at"
    t.text "object_changes", size: :long
    t.text "comment"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
