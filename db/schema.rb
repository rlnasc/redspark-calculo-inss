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

ActiveRecord::Schema[7.1].define(version: 2024_07_08_220234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "proponents", force: :cascade do |t|
    t.string "name"
    t.string "identification_document"
    t.date "birthdate"
    t.string "address"
    t.integer "address_number"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "personal_phonenumber"
    t.string "reference_phonenumber"
    t.decimal "monthly_salary", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
