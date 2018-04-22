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

ActiveRecord::Schema.define(version: 20180422210508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_profiles", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "profile_id"
    t.bigint "seller_id"
    t.bigint "independent_id"
    t.bigint "pyme_id"
    t.index ["category_id"], name: "index_categories_profiles_on_category_id"
    t.index ["independent_id"], name: "index_categories_profiles_on_independent_id"
    t.index ["profile_id"], name: "index_categories_profiles_on_profile_id"
    t.index ["pyme_id"], name: "index_categories_profiles_on_pyme_id"
    t.index ["seller_id"], name: "index_categories_profiles_on_seller_id"
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string "name"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.string "follower_type", null: false
    t.bigint "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_time"
    t.date "end_time"
    t.boolean "state", default: false
    t.float "price"
    t.integer "stock"
    t.text "condition"
    t.text "included"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "offers_products", id: false, force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_offers_products_on_offer_id"
    t.index ["product_id"], name: "index_offers_products_on_product_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_ranges", force: :cascade do |t|
    t.integer "stock", default: 1
    t.float "price"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_price_ranges_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.boolean "rate"
    t.integer "weight"
    t.integer "height"
    t.integer "width"
    t.json "files"
    t.float "price"
    t.string "product_type"
    t.json "images"
    t.json "fields"
    t.text "product_relations", default: [], array: true
    t.string "tags", default: ""
    t.string "productable_type"
    t.bigint "productable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["productable_id", "productable_type"], name: "index_products_on_productable_id_and_productable_type"
    t.index ["productable_type", "productable_id"], name: "index_products_on_productable_type_and_productable_id"
  end

  create_table "products_subcategories", force: :cascade do |t|
    t.bigint "subcategory_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_products_subcategories_on_product_id"
    t.index ["subcategory_id"], name: "index_products_subcategories_on_subcategory_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "type_profile", null: false
    t.string "title"
    t.string "name"
    t.string "email"
    t.json "country"
    t.json "banner"
    t.string "photo"
    t.float "score"
    t.string "launched"
    t.string "phone"
    t.string "url"
    t.string "address"
    t.string "vision"
    t.string "mission"
    t.string "description"
    t.string "web"
    t.json "profile"
    t.string "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.float "score"
    t.bigint "user_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_rates_on_profile_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "avatar"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "offers", "users"
  add_foreign_key "price_ranges", "products"
  add_foreign_key "rates", "profiles"
  add_foreign_key "rates", "users"
end
