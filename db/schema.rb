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

ActiveRecord::Schema.define(version: 20180330030001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "erp_areas_countries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_areas_districts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_erp_areas_districts_on_state_id"
  end

  create_table "erp_areas_states", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "archived", default: false
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_erp_areas_states_on_country_id"
  end

  create_table "erp_consignments_consignment_details", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "product_id"
    t.bigint "consignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["consignment_id"], name: "index_erp_consignments_consignment_details_on_consignment_id"
    t.index ["product_id"], name: "index_erp_consignments_consignment_details_on_product_id"
    t.index ["state_id"], name: "index_erp_consignments_consignment_details_on_state_id"
  end

  create_table "erp_consignments_consignments", force: :cascade do |t|
    t.string "code"
    t.datetime "sent_date"
    t.datetime "return_date"
    t.string "consignment_type"
    t.text "note"
    t.string "status", default: "draft"
    t.boolean "archived", default: false
    t.bigint "contact_id"
    t.bigint "warehouse_id"
    t.bigint "employee_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_erp_consignments_consignments_on_contact_id"
    t.index ["creator_id"], name: "index_erp_consignments_consignments_on_creator_id"
    t.index ["employee_id"], name: "index_erp_consignments_consignments_on_employee_id"
    t.index ["warehouse_id"], name: "index_erp_consignments_consignments_on_warehouse_id"
  end

  create_table "erp_consignments_cs_returns", force: :cascade do |t|
    t.string "code"
    t.datetime "return_date"
    t.text "note"
    t.string "status", default: "draft"
    t.boolean "archived", default: false
    t.bigint "warehouse_id"
    t.bigint "consignment_id"
    t.bigint "contact_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consignment_id"], name: "index_erp_consignments_cs_returns_on_consignment_id"
    t.index ["contact_id"], name: "index_erp_consignments_cs_returns_on_contact_id"
    t.index ["creator_id"], name: "index_erp_consignments_cs_returns_on_creator_id"
    t.index ["warehouse_id"], name: "index_erp_consignments_cs_returns_on_warehouse_id"
  end

  create_table "erp_consignments_return_details", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "cs_return_id"
    t.bigint "consignment_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["consignment_detail_id"], name: "index_erp_consignments_return_details_on_consignment_detail_id"
    t.index ["cs_return_id"], name: "index_erp_consignments_return_details_on_cs_return_id"
    t.index ["state_id"], name: "index_erp_consignments_return_details_on_state_id"
  end

  create_table "erp_contact_groups_price_lists", id: :serial, force: :cascade do |t|
    t.integer "price_list_id"
    t.integer "contact_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_group_id"], name: "index_erp_contact_groups_price_lists_on_contact_group_id"
    t.index ["price_list_id"], name: "index_erp_contact_groups_price_lists_on_price_list_id"
  end

  create_table "erp_contacts_contact_group_conditions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "operator"
    t.string "value"
    t.integer "contact_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_group_id"], name: "index_erp_contacts_contact_group_conditions_on_contact_group_id"
  end

  create_table "erp_contacts_contact_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "discount", default: "0.0"
    t.string "discount_type"
    t.text "note"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_contacts_contact_groups_on_creator_id"
  end

  create_table "erp_contacts_contacts", id: :serial, force: :cascade do |t|
    t.string "image_url"
    t.string "contact_type"
    t.string "code"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "tax_code"
    t.datetime "birthday"
    t.string "email"
    t.string "gender"
    t.text "note"
    t.string "fax"
    t.string "website"
    t.decimal "commission_percent"
    t.boolean "archived", default: false
    t.integer "parent_id"
    t.integer "company_id"
    t.integer "tag_id"
    t.integer "user_id"
    t.integer "creator_id"
    t.integer "contact_group_id"
    t.integer "country_id"
    t.integer "state_id"
    t.integer "price_term_id"
    t.integer "tax_id"
    t.integer "payment_method_id"
    t.integer "payment_term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "district_id"
    t.boolean "is_customer", default: false
    t.boolean "is_supplier", default: false
    t.bigint "salesperson_id"
    t.decimal "new_account_commission_amount"
    t.text "cache_search"
    t.index ["company_id"], name: "index_erp_contacts_contacts_on_company_id"
    t.index ["contact_group_id"], name: "index_erp_contacts_contacts_on_contact_group_id"
    t.index ["country_id"], name: "index_erp_contacts_contacts_on_country_id"
    t.index ["creator_id"], name: "index_erp_contacts_contacts_on_creator_id"
    t.index ["district_id"], name: "index_erp_contacts_contacts_on_district_id"
    t.index ["parent_id"], name: "index_erp_contacts_contacts_on_parent_id"
    t.index ["payment_method_id"], name: "index_erp_contacts_contacts_on_payment_method_id"
    t.index ["payment_term_id"], name: "index_erp_contacts_contacts_on_payment_term_id"
    t.index ["price_term_id"], name: "index_erp_contacts_contacts_on_price_term_id"
    t.index ["salesperson_id"], name: "index_erp_contacts_contacts_on_salesperson_id"
    t.index ["state_id"], name: "index_erp_contacts_contacts_on_state_id"
    t.index ["tag_id"], name: "index_erp_contacts_contacts_on_tag_id"
    t.index ["tax_id"], name: "index_erp_contacts_contacts_on_tax_id"
    t.index ["user_id"], name: "index_erp_contacts_contacts_on_user_id"
  end

  create_table "erp_contacts_contacts_tags", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "tag_id"
    t.index ["contact_id"], name: "index_erp_contacts_contacts_tags_on_contact_id"
    t.index ["tag_id"], name: "index_erp_contacts_contacts_tags_on_tag_id"
  end

  create_table "erp_contacts_conts_cates_commission_rates", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "category_id"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.index ["category_id"], name: "index_erp_contacts_conts_cates_commission_rates_on_category_id"
    t.index ["contact_id"], name: "index_erp_contacts_conts_cates_commission_rates_on_contact_id"
  end

  create_table "erp_contacts_messages", id: :serial, force: :cascade do |t|
    t.text "message"
    t.integer "contact_id"
    t.integer "to_contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_erp_contacts_messages_on_contact_id"
    t.index ["to_contact_id"], name: "index_erp_contacts_messages_on_to_contact_id"
  end

  create_table "erp_contacts_tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_contacts_tags_on_creator_id"
  end

  create_table "erp_contacts_titles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_contacts_titles_on_creator_id"
  end

  create_table "erp_editor_uploads", id: :serial, force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_gift_givens_given_details", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "product_id"
    t.bigint "given_id"
    t.bigint "warehouse_id"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["given_id"], name: "index_erp_gift_givens_given_details_on_given_id"
    t.index ["product_id"], name: "index_erp_gift_givens_given_details_on_product_id"
    t.index ["state_id"], name: "index_erp_gift_givens_given_details_on_state_id"
    t.index ["warehouse_id"], name: "index_erp_gift_givens_given_details_on_warehouse_id"
  end

  create_table "erp_gift_givens_givens", force: :cascade do |t|
    t.string "code"
    t.datetime "given_date"
    t.bigint "creator_id"
    t.bigint "contact_id"
    t.text "note"
    t.string "status"
    t.integer "cache_products_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_erp_gift_givens_givens_on_contact_id"
    t.index ["creator_id"], name: "index_erp_gift_givens_givens_on_creator_id"
  end

  create_table "erp_order_stock_checks_scheck_details", force: :cascade do |t|
    t.bigint "scheck_id"
    t.bigint "order_detail_id"
    t.boolean "available", default: false
    t.string "alternative_items"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_detail_id"], name: "index_erp_order_stock_checks_scheck_details_on_order_detail_id"
    t.index ["scheck_id"], name: "index_erp_order_stock_checks_scheck_details_on_scheck_id"
  end

  create_table "erp_order_stock_checks_schecks", force: :cascade do |t|
    t.string "code"
    t.string "status"
    t.bigint "order_id"
    t.bigint "employee_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_order_stock_checks_schecks_on_creator_id"
    t.index ["employee_id"], name: "index_erp_order_stock_checks_schecks_on_employee_id"
    t.index ["order_id"], name: "index_erp_order_stock_checks_schecks_on_order_id"
  end

  create_table "erp_orders_frontend_order_details", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "frontend_order_id"
    t.string "product_name"
    t.integer "quantity", default: 1
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["frontend_order_id"], name: "index_erp_orders_frontend_order_details_on_frontend_order_id"
    t.index ["product_id"], name: "index_erp_orders_frontend_order_details_on_product_id"
  end

  create_table "erp_orders_frontend_orders", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "status"
    t.integer "customer_id"
    t.integer "consignee_id"
    t.text "data"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cache_total"
    t.integer "creator_id"
    t.index ["consignee_id"], name: "index_erp_orders_frontend_orders_on_consignee_id"
    t.index ["creator_id"], name: "index_erp_orders_frontend_orders_on_creator_id"
    t.index ["customer_id"], name: "index_erp_orders_frontend_orders_on_customer_id"
  end

  create_table "erp_orders_order_details", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "unit_id"
    t.integer "order_id"
    t.integer "quantity", default: 1
    t.decimal "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount"
    t.decimal "shipping_fee"
    t.decimal "tax_amount"
    t.decimal "commission"
    t.decimal "customer_commission"
    t.string "cache_delivery_status"
    t.decimal "cache_total"
    t.decimal "cache_real_revenue"
    t.string "serials"
    t.string "eye_position"
    t.decimal "cost_price", default: "0.0"
    t.boolean "must_same_code"
    t.boolean "must_same_diameter"
    t.bigint "request_product_id"
    t.index ["order_id"], name: "index_erp_orders_order_details_on_order_id"
    t.index ["product_id"], name: "index_erp_orders_order_details_on_product_id"
    t.index ["request_product_id"], name: "index_erp_orders_order_details_on_request_product_id"
    t.index ["unit_id"], name: "index_erp_orders_order_details_on_unit_id"
  end

  create_table "erp_orders_orders", id: :serial, force: :cascade do |t|
    t.string "code"
    t.datetime "order_date"
    t.string "status"
    t.string "cache_payment_status"
    t.decimal "cache_total"
    t.integer "creator_id"
    t.integer "customer_id"
    t.integer "supplier_id"
    t.integer "warehouse_id"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cache_delivery_status"
    t.text "note"
    t.bigint "tax_id"
    t.decimal "cache_tax_amount"
    t.text "cache_search"
    t.string "payment_for"
    t.decimal "cache_commission_amount"
    t.decimal "cache_customer_commission_amount"
    t.integer "doctor_id"
    t.integer "hospital_id"
    t.integer "patient_id"
    t.boolean "is_new_patient", default: false
    t.integer "patient_state_id"
    t.decimal "cache_cost_total", default: "0.0"
    t.decimal "checking_order"
    t.index ["creator_id"], name: "index_erp_orders_orders_on_creator_id"
    t.index ["customer_id"], name: "index_erp_orders_orders_on_customer_id"
    t.index ["employee_id"], name: "index_erp_orders_orders_on_employee_id"
    t.index ["supplier_id"], name: "index_erp_orders_orders_on_supplier_id"
    t.index ["tax_id"], name: "index_erp_orders_orders_on_tax_id"
    t.index ["warehouse_id"], name: "index_erp_orders_orders_on_warehouse_id"
  end

  create_table "erp_ortho_k_careas_pvalues", force: :cascade do |t|
    t.bigint "central_area_id"
    t.bigint "property_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["central_area_id"], name: "index_erp_ortho_k_careas_pvalues_on_central_area_id"
    t.index ["property_value_id"], name: "index_erp_ortho_k_careas_pvalues_on_property_value_id"
  end

  create_table "erp_ortho_k_central_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_ortho_k_patient_states", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "erp_ortho_k_property_values", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_payments_accounting_accounts", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "status"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_payments_accounting_accounts_on_creator_id"
  end

  create_table "erp_payments_accounts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "account_number"
    t.string "owner"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "code"
    t.string "payment_method"
    t.index ["creator_id"], name: "index_erp_payments_accounts_on_creator_id"
  end

  create_table "erp_payments_debts", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.datetime "deadline"
    t.string "note"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_payments_debts_on_creator_id"
    t.index ["order_id"], name: "index_erp_payments_debts_on_order_id"
  end

  create_table "erp_payments_payment_methods", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "type_method"
    t.boolean "is_default"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_payments_payment_methods_on_creator_id"
  end

  create_table "erp_payments_payment_records", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "pay_receive"
    t.decimal "amount"
    t.datetime "payment_date"
    t.text "description"
    t.string "status"
    t.integer "order_id"
    t.integer "accountant_id"
    t.integer "customer_id"
    t.integer "supplier_id"
    t.integer "account_id"
    t.integer "payment_type_id"
    t.integer "employee_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "delivery_id"
    t.integer "debit_account_id"
    t.integer "credit_account_id"
    t.string "payment_method"
    t.string "address"
    t.decimal "cache_for_order_commission_amount", default: "0.0"
    t.string "origin_doc"
    t.string "cache_search"
    t.index ["account_id"], name: "index_erp_payments_payment_records_on_account_id"
    t.index ["accountant_id"], name: "index_erp_payments_payment_records_on_accountant_id"
    t.index ["creator_id"], name: "index_erp_payments_payment_records_on_creator_id"
    t.index ["customer_id"], name: "index_erp_payments_payment_records_on_customer_id"
    t.index ["delivery_id"], name: "index_erp_payments_payment_records_on_delivery_id"
    t.index ["employee_id"], name: "index_erp_payments_payment_records_on_employee_id"
    t.index ["order_id"], name: "index_erp_payments_payment_records_on_order_id"
    t.index ["payment_type_id"], name: "index_erp_payments_payment_records_on_payment_type_id"
    t.index ["supplier_id"], name: "index_erp_payments_payment_records_on_supplier_id"
  end

  create_table "erp_payments_payment_terms", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "timeout", default: 0
    t.string "started_on"
    t.boolean "is_default"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_payments_payment_terms_on_creator_id"
  end

  create_table "erp_payments_payment_type_limits", force: :cascade do |t|
    t.bigint "payment_type_id"
    t.bigint "period_id"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_type_id"], name: "index_erp_payments_payment_type_limits_on_payment_type_id"
    t.index ["period_id"], name: "index_erp_payments_payment_type_limits_on_period_id"
  end

  create_table "erp_payments_payment_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "is_payable"
    t.boolean "is_receivable"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_periods_periods", force: :cascade do |t|
    t.string "name"
    t.datetime "from_date"
    t.datetime "to_date"
    t.string "status"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_periods_periods_on_creator_id"
  end

  create_table "erp_prices_prices", force: :cascade do |t|
    t.string "price_type"
    t.bigint "contact_id"
    t.text "categories"
    t.text "properties_values"
    t.integer "min_quantity"
    t.integer "max_quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "products"
    t.index ["categories"], name: "index_erp_prices_prices_on_categories"
    t.index ["contact_id"], name: "index_erp_prices_prices_on_contact_id"
    t.index ["properties_values"], name: "index_erp_prices_prices_on_properties_values"
  end

  create_table "erp_products_accessories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_accessories_on_creator_id"
  end

  create_table "erp_products_accessory_details", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "accessory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id"], name: "index_erp_products_accessory_details_on_accessory_id"
    t.index ["product_id"], name: "index_erp_products_accessory_details_on_product_id"
  end

  create_table "erp_products_brand_group_details", id: :serial, force: :cascade do |t|
    t.integer "brand_id"
    t.integer "brand_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_group_id"], name: "index_erp_products_brand_group_details_on_brand_group_id"
    t.index ["brand_id"], name: "index_erp_products_brand_group_details_on_brand_id"
  end

  create_table "erp_products_brand_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_brand_groups_on_creator_id"
  end

  create_table "erp_products_brands", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.boolean "is_main", default: false
    t.text "cache_search"
    t.index ["creator_id"], name: "index_erp_products_brands_on_creator_id"
  end

  create_table "erp_products_cache_stocks", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "state_id"
    t.bigint "warehouse_id"
    t.integer "stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_cache_stocks_on_product_id"
    t.index ["state_id"], name: "index_erp_products_cache_stocks_on_state_id"
    t.index ["stock"], name: "index_erp_products_cache_stocks_on_stock"
    t.index ["warehouse_id"], name: "index_erp_products_cache_stocks_on_warehouse_id"
  end

  create_table "erp_products_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.integer "custom_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_categories_on_creator_id"
  end

  create_table "erp_products_categories_pgroups", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.integer "property_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_erp_products_categories_pgroups_on_category_id"
    t.index ["property_group_id"], name: "index_erp_products_categories_pgroups_on_property_group_id"
  end

  create_table "erp_products_comments", id: :serial, force: :cascade do |t|
    t.text "message"
    t.integer "parent_id"
    t.boolean "archived", default: false
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_comments_on_product_id"
    t.index ["user_id"], name: "index_erp_products_comments_on_user_id"
  end

  create_table "erp_products_customer_taxes", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_customer_taxes_on_product_id"
    t.index ["tax_id"], name: "index_erp_products_customer_taxes_on_tax_id"
  end

  create_table "erp_products_damage_record_details", id: :serial, force: :cascade do |t|
    t.integer "quantity", default: 1
    t.text "note"
    t.integer "product_id"
    t.integer "damage_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["damage_record_id"], name: "index_erp_products_damage_record_details_on_damage_record_id"
    t.index ["product_id"], name: "index_erp_products_damage_record_details_on_product_id"
    t.index ["state_id"], name: "index_erp_products_damage_record_details_on_state_id"
  end

  create_table "erp_products_damage_records", id: :serial, force: :cascade do |t|
    t.string "code"
    t.datetime "date"
    t.text "description"
    t.string "status"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.index ["creator_id"], name: "index_erp_products_damage_records_on_creator_id"
    t.index ["employee_id"], name: "index_erp_products_damage_records_on_employee_id"
    t.index ["warehouse_id"], name: "index_erp_products_damage_records_on_warehouse_id"
  end

  create_table "erp_products_events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "from_date"
    t.datetime "to_date"
    t.string "image_url"
    t.text "description"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_events_on_creator_id"
  end

  create_table "erp_products_events_products", id: :serial, force: :cascade do |t|
    t.integer "event_id"
    t.integer "product_id"
    t.index ["event_id"], name: "index_erp_products_events_products_on_event_id"
    t.index ["product_id"], name: "index_erp_products_events_products_on_product_id"
  end

  create_table "erp_products_hkerp_products", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "hkerp_product_id"
    t.decimal "price", default: "0.0"
    t.integer "stock", default: 0
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_hkerp_products_on_product_id"
  end

  create_table "erp_products_inventory_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "hot_name"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.integer "custom_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_inventory_categories_on_creator_id"
  end

  create_table "erp_products_inventory_products", id: :serial, force: :cascade do |t|
    t.string "image_url"
    t.string "name"
    t.decimal "price", default: "1.0"
    t.string "gift"
    t.string "product_link"
    t.integer "custom_order"
    t.string "hot_category_name"
    t.boolean "is_stock", default: true
    t.boolean "archived", default: false
    t.integer "inventory_category_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_inventory_products_on_creator_id"
    t.index ["inventory_category_id"], name: "index_erp_products_inventory_products_on_inventory_category_id"
  end

  create_table "erp_products_manufacturings", id: :serial, force: :cascade do |t|
    t.string "code"
    t.datetime "manufacturing_date"
    t.integer "quantity", default: 1
    t.boolean "is_auto_reduce_part_quantity", default: true
    t.text "note"
    t.string "status"
    t.integer "product_id"
    t.integer "responsible_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_manufacturings_on_creator_id"
    t.index ["product_id"], name: "index_erp_products_manufacturings_on_product_id"
    t.index ["responsible_id"], name: "index_erp_products_manufacturings_on_responsible_id"
  end

  create_table "erp_products_price_lists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.boolean "active", default: true
    t.boolean "all_warehouses", default: true
    t.boolean "all_users", default: true
    t.boolean "all_contact_groups", default: true
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_price_lists_on_creator_id"
  end

  create_table "erp_products_price_lists_users", id: :serial, force: :cascade do |t|
    t.integer "price_list_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_list_id"], name: "index_erp_products_price_lists_users_on_price_list_id"
    t.index ["user_id"], name: "index_erp_products_price_lists_users_on_user_id"
  end

  create_table "erp_products_price_lists_warehouses", id: :serial, force: :cascade do |t|
    t.integer "price_list_id"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_list_id"], name: "index_erp_products_price_lists_warehouses_on_price_list_id"
    t.index ["warehouse_id"], name: "index_erp_products_price_lists_warehouses_on_warehouse_id"
  end

  create_table "erp_products_product_images", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.string "image_url"
    t.datetime "created_at", default: "2018-01-09 01:23:24", null: false
    t.datetime "updated_at", default: "2018-01-09 01:23:24", null: false
    t.index ["product_id"], name: "index_erp_products_product_images_on_product_id"
  end

  create_table "erp_products_products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "barcode"
    t.decimal "price", default: "1.0"
    t.decimal "cost", default: "0.0"
    t.decimal "on_hand", default: "0.0"
    t.decimal "weight", default: "0.0"
    t.decimal "volume", default: "0.0"
    t.decimal "stock_min", default: "0.0"
    t.decimal "stock_max", default: "999999.0"
    t.text "description"
    t.text "short_description"
    t.boolean "is_deal", default: false
    t.boolean "is_new", default: false
    t.boolean "is_bestseller", default: false
    t.boolean "is_business_choices", default: false
    t.boolean "is_top_business_choices", default: false
    t.decimal "deal_price"
    t.integer "deal_percent"
    t.integer "brand_id"
    t.integer "accessory_id"
    t.text "events_note"
    t.text "meta_keywords"
    t.text "meta_description"
    t.datetime "deal_from_date"
    t.datetime "deal_to_date"
    t.text "internal_note"
    t.boolean "can_be_sold", default: true
    t.boolean "can_be_purchased", default: true
    t.boolean "is_for_pos", default: true
    t.boolean "point_enabled", default: true
    t.boolean "archived", default: false
    t.integer "category_id"
    t.integer "unit_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
    t.string "product_intro_link"
    t.text "cache_search"
    t.boolean "is_stock_inventory", default: false
    t.string "alias"
    t.boolean "is_sold_out", default: false
    t.text "cache_properties"
    t.integer "cache_stock"
    t.boolean "is_call", default: false
    t.boolean "is_outside", default: false
    t.string "cache_diameter"
    t.string "ordered_code"
    t.index ["accessory_id"], name: "index_erp_products_products_on_accessory_id"
    t.index ["brand_id"], name: "index_erp_products_products_on_brand_id"
    t.index ["category_id"], name: "index_erp_products_products_on_category_id"
    t.index ["creator_id"], name: "index_erp_products_products_on_creator_id"
    t.index ["unit_id"], name: "index_erp_products_products_on_unit_id"
  end

  create_table "erp_products_products_gifts", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "gift_id"
    t.integer "quantity", default: 1
    t.decimal "price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_erp_products_products_gifts_on_gift_id"
    t.index ["product_id"], name: "index_erp_products_products_gifts_on_product_id"
  end

  create_table "erp_products_products_parts", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "part_id"
    t.integer "quantity", default: 1
    t.decimal "total", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_erp_products_products_parts_on_part_id"
    t.index ["product_id"], name: "index_erp_products_products_parts_on_product_id"
  end

  create_table "erp_products_products_units", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "unit_id"
    t.decimal "conversion_value", default: "1.0"
    t.decimal "price", default: "0.0"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_products_units_on_product_id"
    t.index ["unit_id"], name: "index_erp_products_products_units_on_unit_id"
  end

  create_table "erp_products_products_values", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "properties_value_id"
    t.index ["product_id"], name: "index_erp_products_products_values_on_product_id"
    t.index ["properties_value_id"], name: "index_erp_products_products_values_on_properties_value_id"
  end

  create_table "erp_products_properties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.integer "property_group_id"
    t.boolean "is_show_list"
    t.boolean "is_show_detail"
    t.integer "custom_order", default: 0
    t.boolean "is_show_website", default: false
    t.index ["creator_id"], name: "index_erp_products_properties_on_creator_id"
    t.index ["property_group_id"], name: "index_erp_products_properties_on_property_group_id"
  end

  create_table "erp_products_properties_values", id: :serial, force: :cascade do |t|
    t.integer "property_id"
    t.string "value"
    t.boolean "is_show_website", default: false
    t.index ["property_id"], name: "index_erp_products_properties_values_on_property_id"
  end

  create_table "erp_products_property_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "custom_order", default: 0
    t.index ["creator_id"], name: "index_erp_products_property_groups_on_creator_id"
  end

  create_table "erp_products_ratings", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "star"
    t.boolean "archived", default: true
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_ratings_on_product_id"
    t.index ["user_id"], name: "index_erp_products_ratings_on_user_id"
  end

  create_table "erp_products_state_check_details", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.text "note"
    t.bigint "state_id"
    t.bigint "product_id"
    t.bigint "state_check_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "old_state_id"
    t.index ["old_state_id"], name: "index_erp_products_state_check_details_on_old_state_id"
    t.index ["product_id"], name: "index_erp_products_state_check_details_on_product_id"
    t.index ["state_check_id"], name: "index_erp_products_state_check_details_on_state_check_id"
    t.index ["state_id"], name: "index_erp_products_state_check_details_on_state_id"
  end

  create_table "erp_products_state_checks", force: :cascade do |t|
    t.string "code"
    t.datetime "check_date"
    t.text "note"
    t.string "status", default: "draft"
    t.boolean "archived", default: false
    t.bigint "warehouse_id"
    t.bigint "employee_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_state_checks_on_creator_id"
    t.index ["employee_id"], name: "index_erp_products_state_checks_on_employee_id"
    t.index ["warehouse_id"], name: "index_erp_products_state_checks_on_warehouse_id"
  end

  create_table "erp_products_states", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status", default: "draft"
    t.boolean "archived", default: false
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_states_on_creator_id"
  end

  create_table "erp_products_stock_check_details", id: :serial, force: :cascade do |t|
    t.integer "quantity", default: 1
    t.text "note"
    t.integer "product_id"
    t.integer "stock_check_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.integer "real"
    t.integer "stock"
    t.string "serials"
    t.index ["product_id"], name: "index_erp_products_stock_check_details_on_product_id"
    t.index ["state_id"], name: "index_erp_products_stock_check_details_on_state_id"
    t.index ["stock_check_id"], name: "index_erp_products_stock_check_details_on_stock_check_id"
  end

  create_table "erp_products_stock_checks", id: :serial, force: :cascade do |t|
    t.string "code"
    t.datetime "adjustment_date"
    t.text "description"
    t.string "status"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.index ["creator_id"], name: "index_erp_products_stock_checks_on_creator_id"
    t.index ["employee_id"], name: "index_erp_products_stock_checks_on_employee_id"
    t.index ["warehouse_id"], name: "index_erp_products_stock_checks_on_warehouse_id"
  end

  create_table "erp_products_units", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_products_units_on_creator_id"
  end

  create_table "erp_products_vendor_taxes", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_products_vendor_taxes_on_product_id"
    t.index ["tax_id"], name: "index_erp_products_vendor_taxes_on_tax_id"
  end

  create_table "erp_qdeliveries_deliveries", force: :cascade do |t|
    t.string "code"
    t.datetime "date"
    t.string "delivery_type"
    t.text "note"
    t.string "status", default: "delivered"
    t.boolean "archived", default: false
    t.bigint "customer_id"
    t.bigint "supplier_id"
    t.bigint "employee_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cache_payment_status"
    t.string "payment_for"
    t.decimal "cache_total"
    t.string "address"
    t.index ["creator_id"], name: "index_erp_qdeliveries_deliveries_on_creator_id"
    t.index ["customer_id"], name: "index_erp_qdeliveries_deliveries_on_customer_id"
    t.index ["employee_id"], name: "index_erp_qdeliveries_deliveries_on_employee_id"
    t.index ["supplier_id"], name: "index_erp_qdeliveries_deliveries_on_supplier_id"
  end

  create_table "erp_qdeliveries_delivery_details", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "order_detail_id"
    t.bigint "state_id"
    t.bigint "warehouse_id"
    t.bigint "delivery_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.decimal "price"
    t.decimal "cache_total"
    t.string "serials"
    t.index ["delivery_id"], name: "index_erp_qdeliveries_delivery_details_on_delivery_id"
    t.index ["order_detail_id"], name: "index_erp_qdeliveries_delivery_details_on_order_detail_id"
    t.index ["product_id"], name: "index_erp_qdeliveries_delivery_details_on_product_id"
    t.index ["state_id"], name: "index_erp_qdeliveries_delivery_details_on_state_id"
    t.index ["warehouse_id"], name: "index_erp_qdeliveries_delivery_details_on_warehouse_id"
  end

  create_table "erp_stock_transfers_transfer_details", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "product_id"
    t.bigint "transfer_id"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_erp_stock_transfers_transfer_details_on_product_id"
    t.index ["state_id"], name: "index_erp_stock_transfers_transfer_details_on_state_id"
    t.index ["transfer_id"], name: "index_erp_stock_transfers_transfer_details_on_transfer_id"
  end

  create_table "erp_stock_transfers_transfers", force: :cascade do |t|
    t.string "code"
    t.datetime "received_at"
    t.bigint "source_warehouse_id"
    t.bigint "destination_warehouse_id"
    t.bigint "creator_id"
    t.text "note"
    t.string "status"
    t.integer "cache_products_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_stock_transfers_transfers_on_creator_id"
    t.index ["destination_warehouse_id"], name: "index_erp_stock_transfers_transfers_on_destination_warehouse_id"
    t.index ["source_warehouse_id"], name: "index_erp_stock_transfers_transfers_on_source_warehouse_id"
  end

  create_table "erp_targets_company_targets", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.decimal "bonus_percent"
    t.string "status"
    t.bigint "period_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_targets_company_targets_on_creator_id"
    t.index ["period_id"], name: "index_erp_targets_company_targets_on_period_id"
  end

  create_table "erp_targets_target_details", force: :cascade do |t|
    t.bigint "target_id"
    t.decimal "percent", default: "0.0"
    t.decimal "commission_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_erp_targets_target_details_on_target_id"
  end

  create_table "erp_targets_targets", force: :cascade do |t|
    t.bigint "salesperson_id"
    t.bigint "period_id"
    t.decimal "amount", default: "0.0"
    t.string "status"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_targets_targets_on_creator_id"
    t.index ["period_id"], name: "index_erp_targets_targets_on_period_id"
    t.index ["salesperson_id"], name: "index_erp_targets_targets_on_salesperson_id"
  end

  create_table "erp_taxes_taxes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "scope"
    t.string "computation"
    t.decimal "amount", default: "0.0"
    t.boolean "archived", default: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_taxes_taxes_on_creator_id"
  end

  create_table "erp_user_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "permissions"
  end

  create_table "erp_users", id: :serial, force: :cascade do |t|
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
    t.string "provider"
    t.string "uid"
    t.boolean "backend_access", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar"
    t.string "timezone"
    t.boolean "active", default: false
    t.integer "creator_id"
    t.integer "contact_id"
    t.text "permissions"
    t.string "confirmation_token"
    t.datetime "confirmed_at", default: -> { "now()" }
    t.datetime "confirmation_sent_at"
    t.bigint "user_group_id"
    t.string "address"
    t.text "data"
    t.index ["confirmation_token"], name: "index_erp_users_on_confirmation_token", unique: true
    t.index ["contact_id"], name: "index_erp_users_on_contact_id"
    t.index ["creator_id"], name: "index_erp_users_on_creator_id"
    t.index ["email"], name: "index_erp_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true
    t.index ["user_group_id"], name: "index_erp_users_on_user_group_id"
  end

  create_table "erp_warehouses_warehouses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.integer "creator_id"
    t.integer "contact_id"
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_erp_warehouses_warehouses_on_contact_id"
    t.index ["creator_id"], name: "index_erp_warehouses_warehouses_on_creator_id"
  end

end
