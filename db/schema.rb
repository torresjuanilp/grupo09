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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20171217150157) do
=======
ActiveRecord::Schema.define(version: 20171217131353) do
>>>>>>> f989cd86a3777a44ef08ae86f6704d1d8645b42c

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "titulo"
    t.string "texto"
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_id"
    t.boolean "mejor_resp", default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "question_count", default: 0
    t.integer "questions_count", default: 0
  end

  create_table "categories_questions", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "question_id"
  end

  create_table "comment_qs", force: :cascade do |t|
    t.string "titulo"
    t.string "texto"
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "titulo"
    t.string "texto"
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "answer_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.integer "questions_count", default: 0
  end

  create_table "permits", force: :cascade do |t|
    t.string "name"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.integer "user_id"
    t.boolean "enabled"
  end

  create_table "question_votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "positive"
  end

  create_table "questions", force: :cascade do |t|
    t.string "titulo"
    t.string "descripcion"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.string "slug"
    t.boolean "tiene_mejor_resp", default: false
    t.integer "faculty_id"
<<<<<<< HEAD
    t.integer "visits_count", default: 0
    t.integer "answers_count", default: 0
=======
    t.integer "visits_count", default: 1
    t.integer "answers_count"
    t.integer "score", default: 0
    t.integer "question_vote_id"
>>>>>>> f989cd86a3777a44ef08ae86f6704d1d8645b42c
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "apellido"
    t.string "facultad"
    t.datetime "last_seen_at"
    t.datetime "last_seen_at_before"
    t.integer "puntaje", default: 1
    t.integer "question_id"
    t.integer "permit_id"
    t.integer "faculty_id"
    t.integer "num"
    t.integer "vote_id"
    t.integer "question_vote_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
