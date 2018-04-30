class LocationSerializer < ActiveModel::Serializer
  attributes :id, :address, :latitude, :longitude, :locatable
end
