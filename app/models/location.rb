class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  # Geocoder config
  # reverse_geocoded_by :latitude, :longitude,
  #                     address: :address
  # after_validation :reverse_geocode # auto-fetch address
  # geocoded_by :address
  # after_validation :geocode

  # validates :latitude, :longitude, uniqueness: true

  # before_save :create_geocode
  validate :create_geocode

  def create_geocode
    return unless metadata.blank?
    results = Geocoder.search([latitude, longitude])
    if results.first.data['error'] == 'Unable to geocode'
      errors.add(:address, 'Unable to geocode')
    else
      address      = results.first.address
      state        = results.first.state
      state_code   = results.first.state_code.parameterize
      country      = results.first.country
      country_code = results.first.country_code
      metadata     = results.first.data
      puts address
    end
  end
end
