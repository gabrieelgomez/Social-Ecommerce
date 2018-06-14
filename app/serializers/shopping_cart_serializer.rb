class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :state, :code, :user, :items
  # belongs_to :user
  # has_and_belongs_to_many :products_shopping_cars
end
