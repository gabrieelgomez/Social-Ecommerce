class CreateWaveEducationalTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_teachers do |t|
      t.string :name
      t.integer :user_id
      t.string  :email
      t.json    :country
      t.string  :banner
      t.string  :photo
      t.float   :score
      t.boolean :prominent
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
      t.string  :validation
      t.string  :url
      t.string  :slug
      t.jsonb   :states_codes
      t.jsonb   :countries_codes
      t.boolean :censured, default: false
      t.string :slug
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :wave_educational_teachers, :slug, unique: true
  end
end
