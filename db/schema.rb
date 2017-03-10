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

ActiveRecord::Schema.define(version: 20170310015654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "erp_areas_countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "erp_areas_states", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "archived",   default: false
    t.integer  "country_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["country_id"], name: "index_erp_areas_states_on_country_id", using: :btree
  end

  create_table "erp_contact_groups_price_lists", force: :cascade do |t|
    t.integer  "price_list_id"
    t.integer  "contact_group_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["contact_group_id"], name: "index_erp_contact_groups_price_lists_on_contact_group_id", using: :btree
    t.index ["price_list_id"], name: "index_erp_contact_groups_price_lists_on_price_list_id", using: :btree
  end

  create_table "erp_contacts_contact_group_conditions", force: :cascade do |t|
    t.string   "name"
    t.string   "operator"
    t.string   "value"
    t.integer  "contact_group_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["contact_group_id"], name: "index_erp_contacts_contact_group_conditions_on_contact_group_id", using: :btree
  end

  create_table "erp_contacts_contact_groups", force: :cascade do |t|
    t.string   "name"
    t.decimal  "discount",      default: "0.0"
    t.string   "discount_type"
    t.text     "note"
    t.boolean  "archived",      default: false
    t.integer  "creator_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["creator_id"], name: "index_erp_contacts_contact_groups_on_creator_id", using: :btree
  end

  create_table "erp_contacts_contacts", force: :cascade do |t|
    t.string   "image_url"
    t.string   "contact_type"
    t.string   "code"
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "tax_code"
    t.datetime "birthday"
    t.string   "email"
    t.string   "gender"
    t.text     "note"
    t.string   "fax"
    t.string   "website"
    t.decimal  "commission_percent"
    t.boolean  "archived",           default: false
    t.integer  "parent_id"
    t.integer  "company_id"
    t.integer  "tag_id"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.integer  "contact_group_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "price_term_id"
    t.integer  "tax_id"
    t.integer  "payment_method_id"
    t.integer  "payment_term_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["company_id"], name: "index_erp_contacts_contacts_on_company_id", using: :btree
    t.index ["contact_group_id"], name: "index_erp_contacts_contacts_on_contact_group_id", using: :btree
    t.index ["country_id"], name: "index_erp_contacts_contacts_on_country_id", using: :btree
    t.index ["creator_id"], name: "index_erp_contacts_contacts_on_creator_id", using: :btree
    t.index ["parent_id"], name: "index_erp_contacts_contacts_on_parent_id", using: :btree
    t.index ["payment_method_id"], name: "index_erp_contacts_contacts_on_payment_method_id", using: :btree
    t.index ["payment_term_id"], name: "index_erp_contacts_contacts_on_payment_term_id", using: :btree
    t.index ["price_term_id"], name: "index_erp_contacts_contacts_on_price_term_id", using: :btree
    t.index ["state_id"], name: "index_erp_contacts_contacts_on_state_id", using: :btree
    t.index ["tag_id"], name: "index_erp_contacts_contacts_on_tag_id", using: :btree
    t.index ["tax_id"], name: "index_erp_contacts_contacts_on_tax_id", using: :btree
    t.index ["user_id"], name: "index_erp_contacts_contacts_on_user_id", using: :btree
  end

  create_table "erp_contacts_contacts_tags", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "tag_id"
    t.index ["contact_id"], name: "index_erp_contacts_contacts_tags_on_contact_id", using: :btree
    t.index ["tag_id"], name: "index_erp_contacts_contacts_tags_on_tag_id", using: :btree
  end

  create_table "erp_contacts_tags", force: :cascade do |t|
    t.string   "name"
    t.boolean  "archived",   default: false
    t.integer  "creator_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["creator_id"], name: "index_erp_contacts_tags_on_creator_id", using: :btree
  end

  create_table "erp_contacts_titles", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.boolean  "archived",     default: false
    t.integer  "creator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["creator_id"], name: "index_erp_contacts_titles_on_creator_id", using: :btree
  end

  create_table "erp_products_categories", force: :cascade do |t|
    t.string   "image_url"
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "archived",         default: false
    t.integer  "creator_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["creator_id"], name: "index_erp_products_categories_on_creator_id", using: :btree
  end

  create_table "erp_products_customer_taxes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_customer_taxes_on_product_id", using: :btree
    t.index ["tax_id"], name: "index_erp_products_customer_taxes_on_tax_id", using: :btree
  end

  create_table "erp_products_damage_record_details", force: :cascade do |t|
    t.integer  "quantity",         default: 1
    t.text     "note"
    t.integer  "product_id"
    t.integer  "damage_record_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["damage_record_id"], name: "index_erp_products_damage_record_details_on_damage_record_id", using: :btree
    t.index ["product_id"], name: "index_erp_products_damage_record_details_on_product_id", using: :btree
  end

  create_table "erp_products_damage_records", force: :cascade do |t|
    t.string   "code"
    t.datetime "date"
    t.text     "description"
    t.string   "status"
    t.boolean  "archived",     default: false
    t.integer  "creator_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["creator_id"], name: "index_erp_products_damage_records_on_creator_id", using: :btree
    t.index ["warehouse_id"], name: "index_erp_products_damage_records_on_warehouse_id", using: :btree
  end

  create_table "erp_products_manufacturings", force: :cascade do |t|
    t.string   "code"
    t.datetime "manufacturing_date"
    t.integer  "quantity",                     default: 1
    t.boolean  "is_auto_reduce_part_quantity", default: true
    t.text     "note"
    t.string   "status"
    t.integer  "product_id"
    t.integer  "responsible_id"
    t.integer  "creator_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["creator_id"], name: "index_erp_products_manufacturings_on_creator_id", using: :btree
    t.index ["product_id"], name: "index_erp_products_manufacturings_on_product_id", using: :btree
    t.index ["responsible_id"], name: "index_erp_products_manufacturings_on_responsible_id", using: :btree
  end

  create_table "erp_products_price_lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.boolean  "active",             default: true
    t.boolean  "all_warehouses",     default: true
    t.boolean  "all_users",          default: true
    t.boolean  "all_contact_groups", default: true
    t.integer  "creator_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["creator_id"], name: "index_erp_products_price_lists_on_creator_id", using: :btree
  end

  create_table "erp_products_price_lists_users", force: :cascade do |t|
    t.integer  "price_list_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["price_list_id"], name: "index_erp_products_price_lists_users_on_price_list_id", using: :btree
    t.index ["user_id"], name: "index_erp_products_price_lists_users_on_user_id", using: :btree
  end

  create_table "erp_products_price_lists_warehouses", force: :cascade do |t|
    t.integer  "price_list_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["price_list_id"], name: "index_erp_products_price_lists_warehouses_on_price_list_id", using: :btree
    t.index ["warehouse_id"], name: "index_erp_products_price_lists_warehouses_on_warehouse_id", using: :btree
  end

  create_table "erp_products_product_images", force: :cascade do |t|
    t.integer "product_id"
    t.string  "image_url"
    t.index ["product_id"], name: "index_erp_products_product_images_on_product_id", using: :btree
  end

  create_table "erp_products_products", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "barcode"
    t.decimal  "price",            default: "1.0"
    t.decimal  "cost",             default: "0.0"
    t.decimal  "on_hand",          default: "0.0"
    t.decimal  "weight",           default: "0.0"
    t.decimal  "volume",           default: "0.0"
    t.decimal  "stock_min",        default: "0.0"
    t.decimal  "stock_max",        default: "999999.0"
    t.text     "description"
    t.text     "internal_note"
    t.boolean  "can_be_sold",      default: true
    t.boolean  "can_be_purchased", default: true
    t.boolean  "is_for_pos",       default: true
    t.boolean  "point_enabled",    default: true
    t.boolean  "archived",         default: false
    t.integer  "category_id"
    t.integer  "unit_id"
    t.integer  "creator_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["category_id"], name: "index_erp_products_products_on_category_id", using: :btree
    t.index ["creator_id"], name: "index_erp_products_products_on_creator_id", using: :btree
    t.index ["unit_id"], name: "index_erp_products_products_on_unit_id", using: :btree
  end

  create_table "erp_products_products_parts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "part_id"
    t.integer  "quantity",   default: 1
    t.decimal  "total",      default: "0.0"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["part_id"], name: "index_erp_products_products_parts_on_part_id", using: :btree
    t.index ["product_id"], name: "index_erp_products_products_parts_on_product_id", using: :btree
  end

  create_table "erp_products_products_properties", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_erp_products_products_properties_on_product_id", using: :btree
    t.index ["property_id"], name: "index_erp_products_products_properties_on_property_id", using: :btree
  end

  create_table "erp_products_products_units", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "unit_id"
    t.decimal  "conversion_value", default: "1.0"
    t.decimal  "price",            default: "0.0"
    t.string   "code"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["product_id"], name: "index_erp_products_products_units_on_product_id", using: :btree
    t.index ["unit_id"], name: "index_erp_products_products_units_on_unit_id", using: :btree
  end

  create_table "erp_products_products_values", force: :cascade do |t|
    t.integer "products_property_id"
    t.integer "properties_value_id"
    t.index ["products_property_id"], name: "index_erp_products_products_values_on_products_property_id", using: :btree
    t.index ["properties_value_id"], name: "index_erp_products_products_values_on_properties_value_id", using: :btree
  end

  create_table "erp_products_properties", force: :cascade do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_properties_on_creator_id", using: :btree
  end

  create_table "erp_products_properties_values", force: :cascade do |t|
    t.integer "property_id"
    t.string  "value"
    t.index ["property_id"], name: "index_erp_products_properties_values_on_property_id", using: :btree
  end

  create_table "erp_products_related_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_erp_products_related_categories_on_category_id", using: :btree
  end

  create_table "erp_products_stock_check_details", force: :cascade do |t|
    t.integer  "quantity",       default: 1
    t.text     "note"
    t.integer  "product_id"
    t.integer  "stock_check_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["product_id"], name: "index_erp_products_stock_check_details_on_product_id", using: :btree
    t.index ["stock_check_id"], name: "index_erp_products_stock_check_details_on_stock_check_id", using: :btree
  end

  create_table "erp_products_stock_checks", force: :cascade do |t|
    t.string   "code"
    t.datetime "adjustment_date"
    t.text     "description"
    t.string   "status"
    t.boolean  "archived",        default: false
    t.integer  "creator_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["creator_id"], name: "index_erp_products_stock_checks_on_creator_id", using: :btree
    t.index ["warehouse_id"], name: "index_erp_products_stock_checks_on_warehouse_id", using: :btree
  end

  create_table "erp_products_units", force: :cascade do |t|
    t.string   "name"
    t.boolean  "archived",   default: false
    t.integer  "creator_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["creator_id"], name: "index_erp_products_units_on_creator_id", using: :btree
  end

  create_table "erp_products_vendor_taxes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_vendor_taxes_on_product_id", using: :btree
    t.index ["tax_id"], name: "index_erp_products_vendor_taxes_on_tax_id", using: :btree
  end

  create_table "erp_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "timezone"
    t.boolean  "active",                 default: false
    t.integer  "creator_id"
    t.integer  "contact_id"
    t.index ["contact_id"], name: "index_erp_users_on_contact_id", using: :btree
    t.index ["creator_id"], name: "index_erp_users_on_creator_id", using: :btree
    t.index ["email"], name: "index_erp_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true, using: :btree
  end

end
