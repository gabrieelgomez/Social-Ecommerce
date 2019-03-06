class LocationSerializer < ActiveModel::Serializer
  attributes :id, :address, :state, :state_code, :country, :country_code, :latitude, :longitude, :locatable
end
