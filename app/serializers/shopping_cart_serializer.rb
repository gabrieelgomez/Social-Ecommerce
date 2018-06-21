class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :state, :code, :user, :items
end
