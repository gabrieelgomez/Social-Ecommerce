class CreateWaveEducationalTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_teachers do |t|
      t.string   :name
      t.string   :email
      t.string   :banner
      t.string   :photo
      t.boolean  :prominent
      t.string   :phone
      t.string   :url
      t.text     :address
      t.text     :description
      t.string   :web
      t.string   :url
      t.string   :slug
      t.jsonb    :states_codes
      t.jsonb    :countries_codes
      t.boolean  :censured, default: false
      t.integer  :user_id
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :wave_educational_teachers, :slug, unique: true
  end
end
