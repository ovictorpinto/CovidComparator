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

ActiveRecord::Schema.define(version: 2020_03_22_162418) do

  create_table "countries", force: :cascade do |t|
    t.date "dtFirstConfirmed"
    t.date "dtFirstDeath"
    t.integer "nrDeaths7"
    t.integer "nrConfirmed7"
    t.integer "nrDeaths14"
    t.integer "nrConfirmed14"
    t.integer "nrDeaths30"
    t.integer "nrConfirmed30"
    t.integer "nrDeathsLast"
    t.integer "nrConfirmedLast"
    t.integer "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_reports", force: :cascade do |t|
    t.string "country"
    t.date "day"
    t.integer "confirmed"
    t.integer "deaths"
    t.integer "recovery"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "populations", force: :cascade do |t|
    t.string "country"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
