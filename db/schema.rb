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

<<<<<<< 5ca82dc7e39b1143f63c368f4506065dbb0c07db
ActiveRecord::Schema.define(version: 20170503020426) do
=======
ActiveRecord::Schema.define(version: 20170601033433) do
>>>>>>> update sitemap

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.integer  "district_id"
    t.index ["company_id"], name: "index_erp_contacts_contacts_on_company_id", using: :btree
    t.index ["contact_group_id"], name: "index_erp_contacts_contacts_on_contact_group_id", using: :btree
    t.index ["country_id"], name: "index_erp_contacts_contacts_on_country_id", using: :btree
    t.index ["creator_id"], name: "index_erp_contacts_contacts_on_creator_id", using: :btree
    t.index ["district_id"], name: "index_erp_contacts_contacts_on_district_id", using: :btree
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

  create_table "erp_contacts_messages", force: :cascade do |t|
    t.text     "message"
    t.integer  "contact_id"
    t.integer  "to_contact_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["contact_id"], name: "index_erp_contacts_messages_on_contact_id", using: :btree
    t.index ["to_contact_id"], name: "index_erp_contacts_messages_on_to_contact_id", using: :btree
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

  create_table "erp_editor_uploads", force: :cascade do |t|
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_mini_stores_article_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "alias"
    t.integer  "custom_order"
    t.text     "meta_keywords"
    t.text     "meta_description"
<<<<<<< 5ca82dc7e39b1143f63c368f4506065dbb0c07db
    t.boolean  "archived",         default: false
    t.integer  "creator_id"
=======
    t.boolean  "is_hot",            default: false
    t.boolean  "archived",          default: false
    t.integer  "creator_id"
    t.integer  "brand_group_id"
    t.integer  "custom_order"
    t.integer  "level"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "brand_id"
    t.string   "image_menu"
    t.string   "image_menu_title"
    t.string   "image_menu_link"
    t.text     "cache_search"
    t.index ["brand_group_id"], name: "index_erp_menus_menus_on_brand_group_id", using: :btree
    t.index ["creator_id"], name: "index_erp_menus_menus_on_creator_id", using: :btree
  end

  create_table "erp_menus_menus_products_categories", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_erp_menus_menus_products_categories_on_category_id", using: :btree
    t.index ["menu_id"], name: "index_erp_menus_menus_products_categories_on_menu_id", using: :btree
  end

  create_table "erp_menus_related_menus", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_erp_menus_related_menus_on_menu_id", using: :btree
    t.index ["parent_id"], name: "index_erp_menus_related_menus_on_parent_id", using: :btree
  end

  create_table "erp_newsletters_newsletters", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_orders_frontend_order_details", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "frontend_order_id"
    t.string   "product_name"
    t.integer  "quantity",          default: 1
    t.decimal  "price"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "description"
    t.index ["frontend_order_id"], name: "index_erp_orders_frontend_order_details_on_frontend_order_id", using: :btree
    t.index ["product_id"], name: "index_erp_orders_frontend_order_details_on_product_id", using: :btree
  end

  create_table "erp_orders_frontend_orders", force: :cascade do |t|
    t.string   "code"
    t.string   "status"
    t.integer  "customer_id"
    t.integer  "consignee_id"
    t.text     "data"
    t.text     "note"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "cache_total"
    t.integer  "creator_id"
    t.index ["consignee_id"], name: "index_erp_orders_frontend_orders_on_consignee_id", using: :btree
    t.index ["creator_id"], name: "index_erp_orders_frontend_orders_on_creator_id", using: :btree
    t.index ["customer_id"], name: "index_erp_orders_frontend_orders_on_customer_id", using: :btree
  end

  create_table "erp_orders_order_details", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "unit_id"
    t.integer  "order_id"
    t.integer  "quantity",    default: 1
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["order_id"], name: "index_erp_orders_order_details_on_order_id", using: :btree
    t.index ["product_id"], name: "index_erp_orders_order_details_on_product_id", using: :btree
    t.index ["unit_id"], name: "index_erp_orders_order_details_on_unit_id", using: :btree
  end

  create_table "erp_orders_orders", force: :cascade do |t|
    t.string   "code"
    t.datetime "order_date"
    t.string   "status"
    t.string   "cache_payment_status"
    t.decimal  "cache_total"
    t.integer  "creator_id"
    t.integer  "customer_id"
    t.integer  "supplier_id"
    t.integer  "warehouse_id"
    t.integer  "salesperson_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["creator_id"], name: "index_erp_orders_orders_on_creator_id", using: :btree
    t.index ["customer_id"], name: "index_erp_orders_orders_on_customer_id", using: :btree
    t.index ["salesperson_id"], name: "index_erp_orders_orders_on_salesperson_id", using: :btree
    t.index ["supplier_id"], name: "index_erp_orders_orders_on_supplier_id", using: :btree
    t.index ["warehouse_id"], name: "index_erp_orders_orders_on_warehouse_id", using: :btree
  end

  create_table "erp_payments_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "account_number"
    t.string   "owner"
    t.boolean  "archived",       default: false
    t.integer  "creator_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["creator_id"], name: "index_erp_payments_accounts_on_creator_id", using: :btree
  end

  create_table "erp_payments_debts", force: :cascade do |t|
    t.integer  "order_id"
    t.datetime "deadline"
    t.string   "note"
    t.boolean  "archived",   default: false
    t.integer  "creator_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["creator_id"], name: "index_erp_payments_debts_on_creator_id", using: :btree
    t.index ["order_id"], name: "index_erp_payments_debts_on_order_id", using: :btree
  end

  create_table "erp_payments_payment_methods", force: :cascade do |t|
    t.string   "name"
    t.string   "type_method"
    t.boolean  "is_default"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_payments_payment_methods_on_creator_id", using: :btree
  end

  create_table "erp_payments_payment_records", force: :cascade do |t|
    t.string   "code"
    t.string   "payment_type"
    t.decimal  "amount"
    t.datetime "payment_date"
    t.text     "description"
    t.string   "status"
    t.boolean  "archived",      default: false
    t.integer  "order_id"
    t.integer  "accountant_id"
    t.integer  "contact_id"
    t.integer  "creator_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["accountant_id"], name: "index_erp_payments_payment_records_on_accountant_id", using: :btree
    t.index ["contact_id"], name: "index_erp_payments_payment_records_on_contact_id", using: :btree
    t.index ["creator_id"], name: "index_erp_payments_payment_records_on_creator_id", using: :btree
    t.index ["order_id"], name: "index_erp_payments_payment_records_on_order_id", using: :btree
  end

  create_table "erp_payments_payment_terms", force: :cascade do |t|
    t.string   "name"
    t.integer  "timeout",    default: 0
    t.string   "started_on"
    t.boolean  "is_default"
    t.boolean  "archived",   default: false
    t.integer  "creator_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["creator_id"], name: "index_erp_payments_payment_terms_on_creator_id", using: :btree
  end

  create_table "erp_products_accessories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_products_accessories_on_creator_id", using: :btree
  end

  create_table "erp_products_accessory_details", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "accessory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["accessory_id"], name: "index_erp_products_accessory_details_on_accessory_id", using: :btree
    t.index ["product_id"], name: "index_erp_products_accessory_details_on_product_id", using: :btree
  end

  create_table "erp_products_brand_group_details", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "brand_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["brand_group_id"], name: "index_erp_products_brand_group_details_on_brand_group_id", using: :btree
    t.index ["brand_id"], name: "index_erp_products_brand_group_details_on_brand_id", using: :btree
  end

  create_table "erp_products_brand_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_products_brand_groups_on_creator_id", using: :btree
  end

  create_table "erp_products_brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "archived",     default: false
    t.integer  "creator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image_url"
    t.boolean  "is_main",      default: false
    t.text     "cache_search"
    t.index ["creator_id"], name: "index_erp_products_brands_on_creator_id", using: :btree
  end

  create_table "erp_products_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.boolean  "archived",     default: false
    t.integer  "creator_id"
    t.integer  "custom_order"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["creator_id"], name: "index_erp_products_categories_on_creator_id", using: :btree
  end

  create_table "erp_products_categories_pgroups", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "property_group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_id"], name: "index_erp_products_categories_pgroups_on_category_id", using: :btree
    t.index ["property_group_id"], name: "index_erp_products_categories_pgroups_on_property_group_id", using: :btree
  end

  create_table "erp_products_comments", force: :cascade do |t|
    t.text     "message"
    t.integer  "parent_id"
    t.boolean  "archived",   default: false
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["product_id"], name: "index_erp_products_comments_on_product_id", using: :btree
    t.index ["user_id"], name: "index_erp_products_comments_on_user_id", using: :btree
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

  create_table "erp_products_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "from_date"
    t.datetime "to_date"
    t.string   "image_url"
    t.text     "description"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_products_events_on_creator_id", using: :btree
  end

  create_table "erp_products_events_products", force: :cascade do |t|
    t.integer "event_id"
    t.integer "product_id"
    t.index ["event_id"], name: "index_erp_products_events_products_on_event_id", using: :btree
    t.index ["product_id"], name: "index_erp_products_events_products_on_product_id", using: :btree
  end

  create_table "erp_products_hkerp_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "hkerp_product_id"
    t.decimal  "price",            default: "0.0"
    t.integer  "stock",            default: 0
    t.text     "data"
>>>>>>> update sitemap
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["creator_id"], name: "index_erp_mini_stores_article_categories_on_creator_id", using: :btree
  end

  create_table "erp_mini_stores_articles", force: :cascade do |t|
    t.string   "image_url"
    t.string   "name"
    t.text     "content"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "archived",            default: false
    t.integer  "article_category_id"
    t.integer  "creator_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["article_category_id"], name: "index_erp_mini_stores_articles_on_article_category_id", using: :btree
    t.index ["creator_id"], name: "index_erp_mini_stores_articles_on_creator_id", using: :btree
  end

  create_table "erp_mini_stores_brands", force: :cascade do |t|
    t.string   "image_url"
<<<<<<< 5ca82dc7e39b1143f63c368f4506065dbb0c07db
=======
    t.datetime "created_at", default: '2017-05-15 03:54:25', null: false
    t.datetime "updated_at", default: '2017-05-15 03:54:25', null: false
    t.index ["product_id"], name: "index_erp_products_product_images_on_product_id", using: :btree
  end

  create_table "erp_products_products", force: :cascade do |t|
>>>>>>> update sitemap
    t.string   "name"
    t.text     "description"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "archived",         default: false
    t.integer  "creator_id"
<<<<<<< 5ca82dc7e39b1143f63c368f4506065dbb0c07db
=======
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "short_name"
    t.string   "product_intro_link"
    t.text     "cache_search"
    t.boolean  "is_stock_inventory",      default: false
    t.string   "ebay_id"
    t.string   "alias"
    t.string   "amazon_id"
    t.index ["accessory_id"], name: "index_erp_products_products_on_accessory_id", using: :btree
    t.index ["brand_id"], name: "index_erp_products_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_erp_products_products_on_category_id", using: :btree
    t.index ["creator_id"], name: "index_erp_products_products_on_creator_id", using: :btree
    t.index ["unit_id"], name: "index_erp_products_products_on_unit_id", using: :btree
  end

  create_table "erp_products_products_gifts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "gift_id"
    t.integer  "quantity",   default: 1
    t.decimal  "price",      default: "0.0"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["gift_id"], name: "index_erp_products_products_gifts_on_gift_id", using: :btree
    t.index ["product_id"], name: "index_erp_products_products_gifts_on_product_id", using: :btree
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

  create_table "erp_products_products_units", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "unit_id"
    t.decimal  "conversion_value", default: "1.0"
    t.decimal  "price",            default: "0.0"
    t.string   "code"
>>>>>>> update sitemap
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["creator_id"], name: "index_erp_mini_stores_brands_on_creator_id", using: :btree
  end

  create_table "erp_mini_stores_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "custom_order"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "archived",         default: false
    t.integer  "creator_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["creator_id"], name: "index_erp_mini_stores_categories_on_creator_id", using: :btree
  end

  create_table "erp_mini_stores_product_images", force: :cascade do |t|
    t.string   "image_url"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_mini_stores_product_images_on_product_id", using: :btree
  end

  create_table "erp_mini_stores_products", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "short_name"
    t.decimal  "price"
    t.string   "is_deal"
    t.string   "is_bestseller"
    t.string   "deal_price"
    t.string   "deal_percent"
    t.text     "description"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "archived",         default: false
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "creator_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["brand_id"], name: "index_erp_mini_stores_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_erp_mini_stores_products_on_category_id", using: :btree
    t.index ["creator_id"], name: "index_erp_mini_stores_products_on_creator_id", using: :btree
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
    t.string   "provider"
    t.string   "uid"
    t.boolean  "backend_access",         default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "avatar"
    t.string   "timezone"
    t.boolean  "active",                 default: false
    t.integer  "creator_id"
    t.integer  "contact_id"
    t.text     "permissions"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_erp_users_on_confirmation_token", unique: true, using: :btree
    t.index ["contact_id"], name: "index_erp_users_on_contact_id", using: :btree
    t.index ["creator_id"], name: "index_erp_users_on_creator_id", using: :btree
    t.index ["email"], name: "index_erp_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true, using: :btree
  end

end
