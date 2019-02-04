class CreateWaveEducationalStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_students do |t|
      t.string   :name
      t.string   :banner
      t.string   :nickname
      t.string   :avatar
      t.string   :email
      t.string   :phone
      t.text     :address
      t.string   :web
      t.string   :url, default: ''
      t.string   :slug
      t.text     :description
      t.boolean  :censured, default: false
      t.string   :dni
      t.datetime :birth_date
      t.integer  :age
      t.string   :gender
      t.jsonb    :states_codes
      t.jsonb    :countries_codes
      t.integer  :user_id
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :wave_educational_students, :slug, unique: true
  end
end
