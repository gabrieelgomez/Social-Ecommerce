class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  # Geocoder config
  # reverse_geocoded_by :latitude, :longitude,
  #                     address: :address
  # after_validation :reverse_geocode # auto-fetch address
  # geocoded_by :address
  # after_validation :geocode


  # Si lees esto enmanuel, lo de arriba no me funcionaba bien (unas si otras no)
  # Y había que entregar 2 horas después de este commit jajajaja
  before_save :create_geocode

  def create_geocode

    results = Geocoder.search([self.latitude, self.longitude])
    
    self.address      = results.first.address
    self.state        = results.first.state
    self.state_code   = results.first.state_code.parameterize
    self.country      = results.first.country
    self.country_code = results.first.country_code
  end
end
