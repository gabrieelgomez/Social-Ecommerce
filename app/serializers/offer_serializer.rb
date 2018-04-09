class OfferSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_time, :end_time, :longitude, :latitude, :address, :user, :products
end