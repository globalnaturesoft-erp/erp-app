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

ActiveRecord::Schema.define(version: 20170503020426) do

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
    t.boolean  "archived",         default: false
    t.integer  "creator_id"
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
    t.string   "name"
    t.text     "description"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.boolean  "archived",         default: false
    t.integer  "creator_id"
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
