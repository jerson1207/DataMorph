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

ActiveRecord::Schema[8.0].define(version: 2025_02_22_112654) do
  create_table "ucc_inventories", force: :cascade do |t|
    t.integer "shipment"
    t.date "date_received"
    t.string "inventory_type"
    t.string "state_code"
    t.integer "rider_number"
    t.date "date_from"
    t.date "date_to"
    t.integer "filings_received_volume"
    t.integer "index_units_transmitted"
    t.string "index_date_transmitted"
    t.integer "blank_party_units_transmitted"
    t.string "blank_party_date_transmitted"
    t.integer "collateral_units_transmitted"
    t.string "collateral_date_transmitted"
    t.integer "special_collateral_units_transmitted"
    t.string "special_collateral_date_transmitted"
    t.integer "tax_liens_units_transmitted"
    t.string "tax_liens_date_transmitted"
    t.integer "frames_scanned_units_transmitted"
    t.string "frames_scanned_date_transmitted"
    t.integer "mdb_units_transmitted"
    t.string "mdb_date_transmitted"
    t.integer "office_products_units_transmitted"
    t.string "office_products_date_transmitted"
    t.integer "tat_index"
    t.integer "tat_blank_party"
    t.integer "tat_collateral"
    t.integer "tat_special_collateral"
    t.integer "tat_tax_liens"
    t.integer "tat_mdb"
    t.integer "tat_office_products"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blank_party_date_transmitted"], name: "index_ucc_inventories_on_blank_party_date_transmitted"
    t.index ["collateral_date_transmitted"], name: "index_ucc_inventories_on_collateral_date_transmitted"
    t.index ["date_received", "inventory_type"], name: "index_ucc_inventories_on_date_received_and_inventory_type"
    t.index ["date_received", "state_code"], name: "index_ucc_inventories_on_date_received_and_state_code"
    t.index ["date_received"], name: "index_ucc_inventories_on_date_received"
    t.index ["frames_scanned_date_transmitted"], name: "index_ucc_inventories_on_frames_scanned_date_transmitted"
    t.index ["index_date_transmitted"], name: "index_ucc_inventories_on_index_date_transmitted"
    t.index ["mdb_date_transmitted"], name: "index_ucc_inventories_on_mdb_date_transmitted"
    t.index ["office_products_date_transmitted"], name: "index_ucc_inventories_on_office_products_date_transmitted"
    t.index ["special_collateral_date_transmitted"], name: "index_ucc_inventories_on_special_collateral_date_transmitted"
    t.index ["tax_liens_date_transmitted"], name: "index_ucc_inventories_on_tax_liens_date_transmitted"
  end
end
