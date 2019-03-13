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

ActiveRecord::Schema.define(version: 20190313201036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "advertises", force: :cascade do |t|
    t.text "advertisable_type", default: [], array: true
    t.string "cover", default: ""
    t.text "images", default: [], array: true
    t.string "status", default: "", null: false
    t.integer "creator_id", null: false
    t.bigint "seen_count", default: 0, null: false
    t.jsonb "clicked_count", default: []
    t.float "budget", default: 1.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_advertises_on_creator_id"
  end

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
    t.string "cover", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "product_id"
    t.index ["category_id"], name: "index_categories_products_on_category_id"
    t.index ["product_id"], name: "index_categories_products_on_product_id"
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

  create_table "clients", force: :cascade do |t|
    t.string "clientable_type"
    t.bigint "clientable_id"
    t.string "ownerable_type"
    t.bigint "ownerable_id"
    t.string "name", default: ""
    t.string "lastname", default: ""
    t.string "email", default: ""
    t.string "avatar", default: ""
    t.string "dni", default: ""
    t.string "phone", default: ""
    t.text "description", default: ""
    t.integer "created_by", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clientable_type", "clientable_id"], name: "index_clients_on_clientable_type_and_clientable_id"
    t.index ["ownerable_type", "ownerable_id"], name: "index_clients_on_ownerable_type_and_ownerable_id"
  end

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.boolean "body_update"
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contact_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "country"
    t.text "comments"
    t.string "phone"
    t.bigint "profile_id"
    t.bigint "contact_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_type_id"], name: "index_contacts_on_contact_type_id"
    t.index ["profile_id"], name: "index_contacts_on_profile_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "recipientable_type"
    t.bigint "recipientable_id"
    t.string "senderable_type"
    t.bigint "senderable_id"
    t.string "type_messages", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipientable_type", "recipientable_id"], name: "index_conversations_on_recipientable_type_and_recipientable_id"
    t.index ["senderable_type", "senderable_id"], name: "index_conversations_on_senderable_type_and_senderable_id"
  end

  create_table "cotizations", force: :cascade do |t|
    t.string "cotizable_type"
    t.bigint "cotizable_id"
    t.bigint "client_id"
    t.integer "deal_type_id"
    t.float "price"
    t.boolean "status", default: true
    t.string "stage", default: "sent"
    t.string "details", default: ""
    t.string "token", default: ""
    t.string "currency", default: "usd"
    t.text "address", default: ""
    t.text "text", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_cotizations_on_client_id"
    t.index ["cotizable_type", "cotizable_id"], name: "index_cotizations_on_cotizable_type_and_cotizable_id"
  end

  create_table "cotizations_items", force: :cascade do |t|
    t.bigint "cotization_id"
    t.bigint "item_id"
    t.index ["cotization_id"], name: "index_cotizations_items_on_cotization_id"
    t.index ["item_id"], name: "index_cotizations_items_on_item_id"
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

  create_table "custom_fields_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "custom_field_id"
    t.index ["custom_field_id"], name: "index_custom_fields_items_on_custom_field_id"
    t.index ["item_id"], name: "index_custom_fields_items_on_item_id"
  end

  create_table "custom_fields_products", force: :cascade do |t|
    t.bigint "custom_field_id"
    t.bigint "product_id"
    t.index ["custom_field_id"], name: "index_custom_fields_products_on_custom_field_id"
    t.index ["product_id"], name: "index_custom_fields_products_on_product_id"
  end

  create_table "customer_managements", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_customer_managements_on_profile_id"
  end

  create_table "deal_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"
  end

  create_table "educational_descriptions", force: :cascade do |t|
    t.string "institution"
    t.string "degree"
    t.text "academic_discipline"
    t.string "note"
    t.text "activities_groups"
    t.string "start_date"
    t.string "end_date"
    t.boolean "current"
    t.text "description"
    t.jsonb "files"
    t.boolean "all_coins", default: false
    t.boolean "half_coins", default: false
    t.string "educationable_type"
    t.bigint "educationable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["educationable_type", "educationable_id"], name: "educationable_id"
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

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "intranet_boards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "intranet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intranet_id"], name: "index_intranet_boards_on_intranet_id"
  end

  create_table "intranet_cards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "date_start"
    t.bigint "date_end"
    t.jsonb "files"
    t.boolean "store"
    t.bigint "intranet_id"
    t.bigint "board_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_intranet_cards_on_board_id"
    t.index ["intranet_id"], name: "index_intranet_cards_on_intranet_id"
    t.index ["list_id"], name: "index_intranet_cards_on_list_id"
  end

  create_table "intranet_cards_users", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "user_id"
    t.index ["card_id"], name: "index_intranet_cards_users_on_card_id"
    t.index ["user_id"], name: "index_intranet_cards_users_on_user_id"
  end

  create_table "intranet_checklists", force: :cascade do |t|
    t.string "title"
    t.bigint "date_start"
    t.bigint "date_end"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_intranet_checklists_on_card_id"
  end

  create_table "intranet_groups", force: :cascade do |t|
    t.string "title"
    t.text "subtitle"
    t.text "description"
    t.string "banner"
    t.string "cover"
    t.bigint "intranet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intranet_id"], name: "index_intranet_groups_on_intranet_id"
  end

  create_table "intranet_intranets", force: :cascade do |t|
    t.string "title"
    t.boolean "status", default: false
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_intranet_intranets_on_profile_id"
  end

  create_table "intranet_lists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "date_start"
    t.text "date_end"
    t.jsonb "files"
    t.boolean "store"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_intranet_lists_on_board_id"
  end

  create_table "intranet_memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.bigint "intranet_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_intranet_memberships_on_group_id"
    t.index ["intranet_id"], name: "index_intranet_memberships_on_intranet_id"
    t.index ["profile_id"], name: "index_intranet_memberships_on_profile_id"
    t.index ["user_id"], name: "index_intranet_memberships_on_user_id"
  end

  create_table "intranet_tasks", force: :cascade do |t|
    t.string "title"
    t.boolean "completed"
    t.bigint "checklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_intranet_tasks_on_checklist_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "shopping_cart_id"
    t.json "option_values", default: {}
    t.integer "quantity", default: 1, null: false
    t.datetime "deleted_at"
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["shopping_cart_id"], name: "index_items_on_shopping_cart_id"
  end

  create_table "items_options", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "option_id"
    t.index ["item_id"], name: "index_items_options_on_item_id"
    t.index ["option_id"], name: "index_items_options_on_option_id"
  end

  create_table "job_offers", force: :cascade do |t|
    t.string "photo", default: ""
    t.string "charge", default: ""
    t.string "location", default: ""
    t.string "salary", default: ""
    t.integer "day_rutine_type", default: 0
    t.integer "job_type", default: 0
    t.text "details", default: ""
    t.string "status", default: ""
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_job_offers_on_profile_id"
  end

  create_table "locations", force: :cascade do |t|
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.string "state"
    t.string "state_code"
    t.string "country"
    t.string "country_code"
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "metadata"
    t.string "title"
    t.boolean "prominent", default: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "membership_conversations", force: :cascade do |t|
    t.bigint "conversation_id"
    t.string "memberable_type", null: false
    t.integer "memberable_id", null: false
    t.index ["conversation_id"], name: "index_membership_conversations_on_conversation_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.boolean "read", default: false
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
    t.jsonb "category_settings", default: {"post"=>{"app"=>true, "email"=>false}, "wish"=>{"app"=>true, "email"=>false}, "admin"=>{"app"=>true, "email"=>false}, "offer"=>{"app"=>true, "email"=>false}, "follow"=>{"app"=>true, "email"=>false}, "comment"=>{"app"=>true, "email"=>false}, "product"=>{"app"=>true, "email"=>false}, "profile"=>{"app"=>true, "email"=>false}, "cotization"=>{"app"=>true, "email"=>false}, "conversation"=>{"app"=>true, "email"=>false}}
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
    t.string "image"
    t.string "url"
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

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.string "photoable_type"
    t.bigint "photoable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photoable_type", "photoable_id"], name: "index_photos_on_photoable_type_and_photoable_id"
  end

  create_table "policy_terms", force: :cascade do |t|
    t.text "terms", default: "", null: false
    t.string "file", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.string "postable_type"
    t.bigint "postable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id"
  end

  create_table "postulations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_offer_id"], name: "index_postulations_on_job_offer_id"
    t.index ["user_id"], name: "index_postulations_on_user_id"
  end

  create_table "postulations_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "postulation_id"
    t.string "answer"
    t.index ["postulation_id"], name: "index_postulations_questions_on_postulation_id"
    t.index ["question_id"], name: "index_postulations_questions_on_question_id"
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
    t.string "cover"
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
    t.string "type_profile"
    t.jsonb "states_codes"
    t.jsonb "countries_codes"
    t.datetime "deleted_at"
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
    t.string "email"
    t.json "country"
    t.string "banner"
    t.string "photo"
    t.float "score"
    t.boolean "prominent"
    t.string "launched"
    t.string "phone"
    t.string "url"
    t.text "address"
    t.string "vision"
    t.string "mission"
    t.text "description"
    t.string "web"
    t.json "profile"
    t.text "experience"
    t.string "validation"
    t.string "slug"
    t.jsonb "states_codes"
    t.jsonb "countries_codes"
    t.boolean "censured", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "location_prominent", default: false
    t.index ["slug"], name: "index_profiles_on_slug", unique: true
  end

  create_table "q_options", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_q_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", default: "", null: false
    t.integer "q_type", default: 0
    t.integer "position"
    t.bigint "job_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_offer_id"], name: "index_questions_on_job_offer_id"
  end

  create_table "rates", force: :cascade do |t|
    t.float "score"
    t.bigint "user_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "saved_offers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "offer_id"
    t.text "description"
    t.index ["offer_id"], name: "index_saved_offers_on_offer_id"
    t.index ["user_id"], name: "index_saved_offers_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.jsonb "monday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.jsonb "tuesday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.jsonb "wednesday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.jsonb "thursday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.jsonb "friday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.jsonb "saturday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.jsonb "sunday", default: {"open"=>"8:00am", "close"=>"5:00pm"}
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "code", null: false
    t.string "state", default: "", null: false
    t.text "data_stringfy", default: ""
    t.jsonb "data_json", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "google_plus"
    t.string "tripadvisor"
    t.string "pinterest"
    t.string "flickr"
    t.string "behance"
    t.string "dribbble"
    t.string "tumblr"
    t.string "github"
    t.string "linkedin"
    t.string "soundcloud"
    t.string "youtube"
    t.string "skype"
    t.string "vimeo"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.text "reference"
    t.string "type_transfer"
    t.string "status"
    t.bigint "coin_id"
    t.bigint "user_id"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_transactions_on_coin_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
    t.index ["wallet_id"], name: "index_transactions_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "request_change_password"
    t.string "custom_token"
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
    t.string "lastname"
    t.string "banner"
    t.string "nickname"
    t.string "avatar"
    t.string "email"
    t.string "phone_one"
    t.string "phone_two"
    t.string "url", default: ""
    t.string "slug"
    t.text "description"
    t.boolean "censured", default: false
    t.string "dni"
    t.datetime "birth_date"
    t.integer "age"
    t.string "gender"
    t.string "country"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.text "token"
    t.float "balance"
    t.bigint "user_id"
    t.bigint "coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_wallets_on_coin_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  create_table "wave_educational_classes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "content"
    t.string "status", default: ""
    t.boolean "published", default: false
    t.bigint "section_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_wave_educational_classes_on_section_id"
  end

  create_table "wave_educational_course_memberships", force: :cascade do |t|
    t.boolean "locked_by_teacher", default: false
    t.boolean "annulled_by_user", default: false
    t.string "status", default: ""
    t.boolean "subscribed", default: true
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_wave_educational_course_memberships_on_course_id"
    t.index ["user_id"], name: "index_wave_educational_course_memberships_on_user_id"
  end

  create_table "wave_educational_courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "lasted_update"
    t.string "language"
    t.string "status"
    t.boolean "private", default: false
    t.boolean "published", default: false
    t.string "price"
    t.text "requirements"
    t.string "category"
    t.bigint "teacher_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_wave_educational_courses_on_teacher_id"
  end

  create_table "wave_educational_exams", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "examenable_id"
    t.string "examenable_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wave_educational_sections", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status", default: ""
    t.boolean "published", default: false
    t.bigint "course_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_wave_educational_sections_on_course_id"
  end

  create_table "wave_educational_students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "banner"
    t.string "photo"
    t.boolean "prominent"
    t.string "phone"
    t.string "url"
    t.text "address"
    t.text "description"
    t.string "web"
    t.string "slug"
    t.jsonb "states_codes"
    t.jsonb "countries_codes"
    t.boolean "censured", default: false
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_wave_educational_students_on_slug", unique: true
  end

  create_table "wave_educational_teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "banner"
    t.string "photo"
    t.boolean "prominent"
    t.string "phone"
    t.string "url"
    t.text "address"
    t.text "description"
    t.string "web"
    t.string "slug"
    t.jsonb "states_codes"
    t.jsonb "countries_codes"
    t.boolean "censured", default: false
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_wave_educational_teachers_on_slug", unique: true
  end

  create_table "wave_educational_type_questions", force: :cascade do |t|
    t.string "title"
    t.string "question_type"
    t.text "description"
    t.text "question"
    t.text "open_answer"
    t.json "alternative_answer"
    t.boolean "boolean_answer"
    t.bigint "exam_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_wave_educational_type_questions_on_exam_id"
  end

  create_table "wave_work_areas", force: :cascade do |t|
    t.string "title"
    t.jsonb "subareas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wave_work_exams", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "examenable_id"
    t.string "examenable_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wave_work_job_offers", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.string "country"
    t.string "state"
    t.text "address"
    t.integer "vacancies"
    t.boolean "copy_cv", default: false
    t.bigint "profile_id"
    t.bigint "area_id"
    t.bigint "type_hierarchy_id"
    t.bigint "type_job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_wave_work_job_offers_on_area_id"
    t.index ["profile_id"], name: "index_wave_work_job_offers_on_profile_id"
    t.index ["type_hierarchy_id"], name: "index_wave_work_job_offers_on_type_hierarchy_id"
    t.index ["type_job_id"], name: "index_wave_work_job_offers_on_type_job_id"
  end

  create_table "wave_work_requirements", force: :cascade do |t|
    t.string "title"
    t.jsonb "sex"
    t.integer "start_age", default: 0
    t.integer "end_age", default: 0
    t.text "address"
    t.integer "minimal_experience", default: 0
    t.jsonb "languages"
    t.jsonb "education_level"
    t.float "start_salary", default: 0.0
    t.float "end_salary", default: 0.0
    t.boolean "request_salary", default: false
    t.bigint "job_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_offer_id"], name: "index_wave_work_requirements_on_job_offer_id"
  end

  create_table "wave_work_type_hierarchies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wave_work_type_jobs", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wave_work_type_questions", force: :cascade do |t|
    t.string "title"
    t.string "question_type"
    t.text "description"
    t.text "question"
    t.text "open_answer"
    t.json "alternative_answer"
    t.boolean "boolean_answer"
    t.bigint "exam_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_wave_work_type_questions_on_exam_id"
  end

  create_table "wave_work_workers", force: :cascade do |t|
    t.string "name"
    t.string "banner"
    t.string "nickname"
    t.string "avatar"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.string "web"
    t.string "url", default: ""
    t.string "slug"
    t.text "description"
    t.boolean "censured", default: false
    t.string "dni"
    t.datetime "birth_date"
    t.integer "age"
    t.string "gender"
    t.jsonb "states_codes"
    t.jsonb "countries_codes"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_wave_work_workers_on_slug", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", default: ""
    t.float "budget", default: 0.0
    t.string "priority", default: "low"
    t.boolean "response", default: false
    t.boolean "sent", default: false
    t.text "description", default: ""
    t.boolean "private", default: false, null: false
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
  add_foreign_key "contacts", "contact_types"
  add_foreign_key "contacts", "profiles"
  add_foreign_key "cotizations", "clients"
  add_foreign_key "cotizations_items", "cotizations"
  add_foreign_key "cotizations_items", "items"
  add_foreign_key "custom_fields_items", "custom_fields"
  add_foreign_key "custom_fields_items", "items"
  add_foreign_key "custom_fields_products", "custom_fields"
  add_foreign_key "custom_fields_products", "products"
  add_foreign_key "customer_managements", "profiles"
  add_foreign_key "intranet_intranets", "profiles"
  add_foreign_key "items", "products"
  add_foreign_key "items", "shopping_carts"
  add_foreign_key "items_options", "items"
  add_foreign_key "items_options", "options"
  add_foreign_key "job_offers", "profiles"
  add_foreign_key "membership_conversations", "conversations"
  add_foreign_key "messages", "conversations"
  add_foreign_key "offers", "users"
  add_foreign_key "options_products", "options"
  add_foreign_key "options_products", "products"
  add_foreign_key "postulations", "job_offers"
  add_foreign_key "postulations", "users"
  add_foreign_key "postulations_questions", "postulations"
  add_foreign_key "postulations_questions", "questions"
  add_foreign_key "price_ranges", "products"
  add_foreign_key "q_options", "questions"
  add_foreign_key "questions", "job_offers"
  add_foreign_key "rates", "users"
  add_foreign_key "saved_offers", "offers"
  add_foreign_key "saved_offers", "users"
  add_foreign_key "sended_wishes", "profiles"
  add_foreign_key "sended_wishes", "users"
  add_foreign_key "sended_wishes", "wishes"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "transactions", "coins"
  add_foreign_key "transactions", "users"
  add_foreign_key "transactions", "wallets"
  add_foreign_key "wallets", "coins"
  add_foreign_key "wallets", "users"
  add_foreign_key "wishes", "users"
end
