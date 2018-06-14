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
      t.text    :address
      t.string  :vision
      t.string  :mission
      t.text    :description
      t.string  :web
      t.json    :profile
      t.text    :experience
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
