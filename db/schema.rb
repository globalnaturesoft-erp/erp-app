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

ActiveRecord::Schema.define(version: 20170411100818) do

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

  create_table "erp_articles_articles", force: :cascade do |t|
    t.string   "image"
    t.string   "name"
    t.text     "content"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "tags"
    t.boolean  "archived",         default: false
    t.integer  "category_id"
    t.integer  "creator_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["category_id"], name: "index_erp_articles_articles_on_category_id", using: :btree
    t.index ["creator_id"], name: "index_erp_articles_articles_on_creator_id", using: :btree
  end

  create_table "erp_articles_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.string   "alias"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_articles_categories_on_creator_id", using: :btree
  end

  create_table "erp_articles_comments", force: :cascade do |t|
    t.text     "message"
    t.integer  "parent_id"
    t.boolean  "archived",   default: false
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["article_id"], name: "index_erp_articles_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_erp_articles_comments_on_user_id", using: :btree
  end

  create_table "erp_carts_cart_items", force: :cascade do |t|
    t.integer  "quantity",   default: 1
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cart_id"], name: "index_erp_carts_cart_items_on_cart_id", using: :btree
    t.index ["product_id"], name: "index_erp_carts_cart_items_on_product_id", using: :btree
  end

  create_table "erp_carts_carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_carts_compare_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "compare_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["compare_id"], name: "index_erp_carts_compare_items_on_compare_id", using: :btree
    t.index ["product_id"], name: "index_erp_carts_compare_items_on_product_id", using: :btree
  end

  create_table "erp_carts_compares", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_carts_wish_lists", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_carts_wish_lists_on_product_id", using: :btree
    t.index ["user_id"], name: "index_erp_carts_wish_lists_on_user_id", using: :btree
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

  create_table "erp_currencies_currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "archived",   default: false
    t.integer  "creator_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["creator_id"], name: "index_erp_currencies_currencies_on_creator_id", using: :btree
  end

  create_table "erp_currencies_price_terms", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "use_for"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.integer  "currency_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_currencies_price_terms_on_creator_id", using: :btree
    t.index ["currency_id"], name: "index_erp_currencies_price_terms_on_currency_id", using: :btree
  end

  create_table "erp_deliveries_deliveries", force: :cascade do |t|
    t.string   "code"
    t.datetime "date"
    t.string   "delivery_type"
    t.string   "status",        default: "pending"
    t.boolean  "archived",      default: false
    t.integer  "order_id"
    t.integer  "warehouse_id"
    t.integer  "contact_id"
    t.integer  "supplier_id"
    t.integer  "employee_id"
    t.integer  "creator_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["contact_id"], name: "index_erp_deliveries_deliveries_on_contact_id", using: :btree
    t.index ["creator_id"], name: "index_erp_deliveries_deliveries_on_creator_id", using: :btree
    t.index ["employee_id"], name: "index_erp_deliveries_deliveries_on_employee_id", using: :btree
    t.index ["order_id"], name: "index_erp_deliveries_deliveries_on_order_id", using: :btree
    t.index ["supplier_id"], name: "index_erp_deliveries_deliveries_on_supplier_id", using: :btree
    t.index ["warehouse_id"], name: "index_erp_deliveries_deliveries_on_warehouse_id", using: :btree
  end

  create_table "erp_deliveries_delivery_details", force: :cascade do |t|
    t.integer  "quantity",        default: 1
    t.string   "serial_numbers"
    t.integer  "delivery_id"
    t.integer  "order_detail_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["delivery_id"], name: "index_erp_deliveries_delivery_details_on_delivery_id", using: :btree
    t.index ["order_detail_id"], name: "index_erp_deliveries_delivery_details_on_order_detail_id", using: :btree
  end

  create_table "erp_editor_uploads", force: :cascade do |t|
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_menus_menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "style_icon"
    t.string   "style_color"
    t.string   "image_url_1"
    t.string   "image_url_2"
    t.string   "menu_icon"
    t.string   "image_menu_link_1"
    t.string   "image_menu_link_2"
    t.text     "description"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "is_hot",            default: false
    t.boolean  "archived",          default: false
    t.integer  "creator_id"
    t.integer  "brand_group_id"
    t.integer  "custom_order"
    t.integer  "level"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "brand_id"
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
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image_url"
    t.boolean  "is_main",     default: false
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

  create_table "erp_products_hkerp_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "hkerp_product_id"
    t.decimal  "price",            default: "0.0"
    t.integer  "stock",            default: 0
    t.text     "data"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["product_id"], name: "index_erp_products_hkerp_products_on_product_id", using: :btree
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
    t.decimal  "price",                   default: "1.0"
    t.decimal  "cost",                    default: "0.0"
    t.decimal  "on_hand",                 default: "0.0"
    t.decimal  "weight",                  default: "0.0"
    t.decimal  "volume",                  default: "0.0"
    t.decimal  "stock_min",               default: "0.0"
    t.decimal  "stock_max",               default: "999999.0"
    t.text     "description"
    t.text     "short_description"
    t.boolean  "is_deal",                 default: false
    t.boolean  "is_new",                  default: false
    t.boolean  "is_bestseller",           default: false
    t.boolean  "is_business_choices",     default: false
    t.boolean  "is_top_business_choices", default: false
    t.decimal  "deal_price"
    t.integer  "deal_percent"
    t.integer  "brand_id"
    t.integer  "accessory_id"
    t.text     "events_note"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "deal_from_date"
    t.datetime "deal_to_date"
    t.text     "internal_note"
    t.boolean  "can_be_sold",             default: true
    t.boolean  "can_be_purchased",        default: true
    t.boolean  "is_for_pos",              default: true
    t.boolean  "point_enabled",           default: true
    t.boolean  "archived",                default: false
    t.integer  "category_id"
    t.integer  "unit_id"
    t.integer  "creator_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "short_name"
    t.string   "product_intro_link"
    t.index ["accessory_id"], name: "index_erp_products_products_on_accessory_id", using: :btree
    t.index ["brand_id"], name: "index_erp_products_products_on_brand_id", using: :btree
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

  create_table "erp_products_ratings", force: :cascade do |t|
    t.text     "content"
    t.integer  "star"
    t.boolean  "archived",   default: false
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["product_id"], name: "index_erp_products_ratings_on_product_id", using: :btree
    t.index ["user_id"], name: "index_erp_products_ratings_on_user_id", using: :btree
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

  create_table "erp_taxes_taxes", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "scope"
    t.string   "computation"
    t.decimal  "amount",      default: "0.0"
    t.boolean  "archived",    default: false
    t.integer  "creator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_erp_taxes_taxes_on_creator_id", using: :btree
  end

  create_table "erp_testimonials_testimonials", force: :cascade do |t|
    t.string   "logo"
    t.string   "author"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["contact_id"], name: "index_erp_users_on_contact_id", using: :btree
    t.index ["creator_id"], name: "index_erp_users_on_creator_id", using: :btree
    t.index ["email"], name: "index_erp_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "erp_warehouses_warehouses", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "creator_id"
    t.integer  "contact_id"
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["contact_id"], name: "index_erp_warehouses_warehouses_on_contact_id", using: :btree
    t.index ["creator_id"], name: "index_erp_warehouses_warehouses_on_creator_id", using: :btree
  end

end
