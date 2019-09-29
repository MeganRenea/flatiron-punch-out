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

ActiveRecord::Schema.define(version: 2019_09_26_182843) do

  create_table "computers", force: :cascade do |t|
    t.string "name", default: "Computer"
    t.integer "game_id"
    t.integer "hp", default: 100
    t.integer "ap", default: 15
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "computer_id"
    t.integer "round", default: 1
    t.integer "user_wins", default: 0
    t.integer "computer_wins", default: 0
    t.string "fight_pic"
    t.string "front_hit_pic"
    t.string "back_hit_pic"
    t.string "front_miss"
    t.string "back_miss"
    t.string "front_knockout"
    t.string "back_knockout"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "hp", default: 100
    t.integer "ap", default: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "winners", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
