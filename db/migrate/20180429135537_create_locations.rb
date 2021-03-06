class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.text   :address
      t.float  :latitude
      t.float  :longitude
      t.string :state
      t.string :state_code
      t.string :country
      t.string :country_code
      t.boolean :prominent, default: false
      t.jsonb  :metadata
      t.references :locatable, polymorphic: true

      t.timestamps
    end
  end
end
