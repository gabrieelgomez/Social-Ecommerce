class AddColumnsAddressLatitudeAndLongitudeToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :address, :string
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
  end
end
