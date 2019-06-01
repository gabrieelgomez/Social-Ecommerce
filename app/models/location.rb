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
    return unless self.metadata.blank?
    results = Geocoder.search([latitude, longitude])
    if results == [] || results.first.data['error'] == 'Unable to geocode'
      errors.add(:address, 'Unable to geocode')
    else
      self.address      = results.first.address
      self.state        = results.first.state
      self.state_code   = results.first.state_code.parameterize
      self.country      = results.first.country
      self.country_code = results.first.country_code
      self.metadata     = results.first.data
      puts address
    end
  end
end
