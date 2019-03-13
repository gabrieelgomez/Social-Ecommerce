class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer  :user_id
      t.string   :type_profile, null: false
      t.string   :title
      t.string   :email
      t.json     :country
      t.string   :banner
      t.string   :photo
      t.float    :score
      t.boolean  :prominent
      t.string   :launched
      t.string   :phone
      t.string   :url
      t.text     :address
      t.string   :vision
      t.string   :mission
      t.text     :description
      t.string   :web
      t.json     :profile
      t.text     :experience
      t.string   :validation
      t.string   :url
      t.string   :slug
      t.jsonb    :states_codes
      t.jsonb    :countries_codes
      t.boolean  :censured, default: false
      t.string   :slug
      t.integer  :location_prominent, default: false
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :profiles, :slug, unique: true

  end
end
