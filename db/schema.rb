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

ActiveRecord::Schema.define(version: 2026_09_16_000002) do

  create_table "absensis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "siswa_id", null: false
    t.date "tanggal", null: false
    t.string "status_presensi", default: "Hadir", null: false
    t.string "keterangan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["siswa_id", "tanggal"], name: "index_absensis_on_siswa_id_and_tanggal", unique: true
    t.index ["siswa_id"], name: "index_absensis_on_siswa_id"
  end

  create_table "jurusans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "jurusan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "user_id", null: false
    t.boolean "create"
    t.boolean "read"
    t.boolean "uptodate"
    t.boolean "remove"
    t.bigint "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_menu_permissions_on_menu_id"
    t.index ["user_id"], name: "index_menu_permissions_on_user_id"
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "menu_name"
    t.string "menu_route"
    t.boolean "is_active"
    t.bigint "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rayons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "rayon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rombels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "jurusan_id", null: false
    t.string "rombel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jurusan_id"], name: "index_rombels_on_jurusan_id"
  end

  create_table "siswas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nama"
    t.string "jk"
    t.bigint "rombel_id", null: false
    t.bigint "rayon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nisn"
    t.string "nis"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.text "alamat"
    t.string "telepon"
    t.string "nama_ortu"
    t.string "telepon_ortu"
    t.string "status", default: "Aktif"
    t.index ["nis"], name: "index_siswas_on_nis", unique: true
    t.index ["nisn"], name: "index_siswas_on_nisn", unique: true
    t.index ["rayon_id"], name: "index_siswas_on_rayon_id"
    t.index ["rombel_id"], name: "index_siswas_on_rombel_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "absensis", "siswas"
  add_foreign_key "menu_permissions", "menus"
  add_foreign_key "menu_permissions", "users"
  add_foreign_key "rombels", "jurusans"
  add_foreign_key "siswas", "rayons"
  add_foreign_key "siswas", "rombels"
end
