class CreateWaveCitizenCitizens < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_citizens do |t|
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
      t.integer  :status_citizen, default: 0
      t.jsonb    :states_codes
      t.jsonb    :countries_codes
      t.integer  :user_id
      t.belongs_to :type_candidacy
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :wave_citizen_citizens, :slug, unique: true
  end
end
