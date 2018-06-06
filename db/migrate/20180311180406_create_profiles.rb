class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :type_profile, null: false
      t.string  :title
      t.string  :name
      t.string  :email
      t.json    :country
      t.string  :banner
      t.string  :photo
      t.float   :score
      t.string  :launched
      t.string  :phone
      t.string  :url
      t.string  :address
      t.string  :vision
      t.string  :mission
      t.string  :description
      t.string  :web
      t.json    :profile
      t.string  :experience
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
