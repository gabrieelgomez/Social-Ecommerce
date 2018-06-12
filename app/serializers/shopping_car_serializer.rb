class ShoppingCarSerializer < ActiveModel::Serializer
  attributes :id, :state, :user, :products
  # belongs_to :user
  # has_and_belongs_to_many :products_shopping_cars
end
