class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  # Geocoder config
  reverse_geocoded_by :latitude, :longitude,
                      address: :address
  after_validation :reverse_geocode # auto-fetch address
  # geocoded_by :address
  # after_validation :geocode
end
