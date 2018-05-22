class SendedWishSerializer < ActiveModel::Serializer
  attributes :id, :wish, :user, :profile
end
