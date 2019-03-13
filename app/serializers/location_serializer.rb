class LocationSerializer < ActiveModel::Serializer
  attributes :id, :title, :prominent, :address, :state, :state_code, :country, :country_code, :latitude, :longitude, :metadata, :locatable
end
