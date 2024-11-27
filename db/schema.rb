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

ActiveRecord::Schema[8.0].define(version: 2024_11_26_195421) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "booking_code"
    t.string "hotel_name"
    t.string "traveller_name"
    t.datetime "checkin"
    t.datetime "checkout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_of_company"
    t.string "additional_address_information"
    t.string "street_name"
    t.string "street_number"
    t.string "postal_code"
    t.string "city"
    t.string "country"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "booking_correct"
    t.boolean "receiving_correct"
    t.boolean "invoicing_in_germany"
    t.string "country"
    t.string "vat_id"
    t.string "company_name"
    t.datetime "invoice_date"
    t.string "invoice_number"
    t.string "street_name"
    t.string "street_number"
    t.string "postal_code"
    t.string "city"
    t.boolean "invoice_has_invoice"
    t.index ["booking_id"], name: "index_invoices_on_booking_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "invoice_id", null: false
    t.string "name_of_traveler"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "description"
    t.string "category"
    t.integer "quantity"
    t.integer "price_cents"
    t.string "price_currency"
    t.float "vat_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_line_items_on_invoice_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "line_items", "invoices"
end
