class CreateWaveCitizenCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_countries do |t|
      t.string   :name
      t.string   :country_code
      t.string   :currency


      t.datetime :deleted_at
      t.timestamps
    end
  end
end
