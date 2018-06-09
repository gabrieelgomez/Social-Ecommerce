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

ActiveRecord::Schema.define(version: 20180606195542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_wishes", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "sended_wish_id"
    t.text "message"
    t.float "special_price"
    t.datetime "limit_date"
    t.string "claim_code"
    t.text "special_conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_answer_wishes_on_profile_id"
    t.index ["sended_wish_id"], name: "index_answer_wishes_on_sended_wish_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_profiles", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "profile_id"
    t.bigint "pyme_id"
    t.bigint "independent_id"
    t.bigint "seller_id"
    t.index ["category_id"], name: "index_categories_profiles_on_category_id"
    t.index ["independent_id"], name: "index_categories_profiles_on_independent_id"
    t.index ["profile_id"], name: "index_categories_profiles_on_profile_id"
    t.index ["pyme_id"], name: "index_categories_profiles_on_pyme_id"
    t.index ["seller_id"], name: "index_categories_profiles_on_seller_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "recipientable_type"
    t.bigint "recipientable_id"
    t.string "senderable_type"
    t.bigint "senderable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipientable_type", "recipientable_id"], name: "index_conversations_on_recipientable_type_and_recipientable_id"
    t.index ["senderable_type", "senderable_id"], name: "index_conversations_on_senderable_type_and_senderable_id"
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.integer "product_id"
    t.string "customizable_type"
    t.bigint "customizable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customizable_type", "customizable_id"], name: "index_custom_fields_on_customizable_type_and_customizable_id"
  end

  create_table "custom_fields_products", force: :cascade do |t|
    t.bigint "custom_field_id"
    t.bigint "product_id"
    t.index ["custom_field_id"], name: "index_custom_fields_products_on_custom_field_id"
    t.index ["product_id"], name: "index_custom_fields_products_on_product_id"
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

  create_table "locations", force: :cascade do |t|
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.boolean "read"
    t.bigint "conversation_id"
    t.string "image"
    t.string "file"
    t.string "messageable_type"
    t.bigint "messageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["messageable_type", "messageable_id"], name: "index_messages_on_messageable_type_and_messageable_id"
  end

  create_table "notification_settings_settings", force: :cascade do |t|
    t.string "object_type"
    t.bigint "object_id"
    t.bigint "subscription_id"
    t.string "status"
    t.text "settings"
    t.jsonb "category_settings", default: {"wish"=>{"app"=>true, "email"=>true}, "offer"=>{"app"=>true, "email"=>true}, "follow"=>{"app"=>true, "email"=>true}, "product"=>{"app"=>true, "email"=>true}}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_type", "object_id"], name: "idx_settings_object_type_object_id"
    t.index ["subscription_id"], name: "index_notification_settings_settings_on_subscription_id"
  end

  create_table "notification_settings_subscriptions", force: :cascade do |t|
    t.string "subscriber_type"
    t.bigint "subscriber_id"
    t.string "subscribable_type"
    t.bigint "subscribable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscribable_type", "subscribable_id"], name: "idx_subscriptions_subscribable_type_subscribable_id"
    t.index ["subscriber_type", "subscriber_id"], name: "idx_subscriptions_subscriber_type_subscriber_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "target_type"
    t.bigint "target_id"
    t.string "object_type"
    t.bigint "object_id"
    t.boolean "read", default: false, null: false
    t.string "type"
    t.text "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subscription_id"
    t.string "category"
    t.index ["object_type", "object_id"], name: "index_notifications_on_object_type_and_object_id"
    t.index ["read"], name: "index_notifications_on_read"
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
    t.index ["type"], name: "index_notifications_on_type"
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
    t.json "values"
    t.integer "product_id"
    t.string "optionable_type"
    t.bigint "optionable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["optionable_type", "optionable_id"], name: "index_options_on_optionable_type_and_optionable_id"
  end

  create_table "options_products", force: :cascade do |t|
    t.bigint "option_id"
    t.bigint "product_id"
    t.index ["option_id"], name: "index_options_products_on_option_id"
    t.index ["product_id"], name: "index_options_products_on_product_id"
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
    t.text "description", default: ""
    t.boolean "rate"
    t.integer "weight"
    t.integer "height"
    t.integer "width"
    t.json "files"
    t.float "price"
    t.string "service_type"
    t.json "images"
    t.json "fields"
    t.text "product_relations", default: [], array: true
    t.string "tags", default: ""
    t.boolean "prominent"
    t.boolean "virtual_product"
    t.float "stock", default: 0.0
    t.boolean "status", default: true
    t.string "num_ref", default: ""
    t.string "bar_code", default: ""
    t.string "brand", default: ""
    t.string "currency", default: ""
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
    t.string "banner"
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
    t.datetime "deleted_at"
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

  create_table "saved_offers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "offer_id"
    t.text "description"
    t.index ["offer_id"], name: "index_saved_offers_on_offer_id"
    t.index ["user_id"], name: "index_saved_offers_on_user_id"
  end

  create_table "sended_wishes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "profile_id"
    t.bigint "wish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_sended_wishes_on_profile_id"
    t.index ["user_id"], name: "index_sended_wishes_on_user_id"
    t.index ["wish_id"], name: "index_sended_wishes_on_wish_id"
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
    t.integer "read_notification_count"
    t.integer "unread_notification_count"
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

  create_table "wishes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", default: ""
    t.float "budget", default: 0.0
    t.string "priority", default: "low"
    t.boolean "response", default: false
    t.boolean "sent", default: false
    t.text "description", default: ""
    t.string "wisheable_type"
    t.bigint "wisheable_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishes_on_user_id"
    t.index ["wisheable_type", "wisheable_id"], name: "index_wishes_on_wisheable_type_and_wisheable_id"
  end

  add_foreign_key "answer_wishes", "profiles"
  add_foreign_key "answer_wishes", "sended_wishes"
  add_foreign_key "custom_fields_products", "custom_fields"
  add_foreign_key "custom_fields_products", "products"
  add_foreign_key "messages", "conversations"
  add_foreign_key "offers", "users"
  add_foreign_key "options_products", "options"
  add_foreign_key "options_products", "products"
  add_foreign_key "price_ranges", "products"
  add_foreign_key "rates", "profiles"
  add_foreign_key "rates", "users"
  add_foreign_key "saved_offers", "offers"
  add_foreign_key "saved_offers", "users"
  add_foreign_key "sended_wishes", "profiles"
  add_foreign_key "sended_wishes", "users"
  add_foreign_key "sended_wishes", "wishes"
  add_foreign_key "wishes", "users"
end
