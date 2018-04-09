class Offer < ApplicationRecord
  # Relations
	has_and_belongs_to_many :products
  belongs_to :user

  # Geocoder config
  reverse_geocoded_by :latitude, :longitude,
                      :address => :address
  after_validation :reverse_geocode  # auto-fetch address
  # geocoded_by :address
  # after_validation :geocode
end
