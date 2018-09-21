class SavedOfferSerializer < ActiveModel::Serializer
  attributes :id, :user, :offer, :description
end
