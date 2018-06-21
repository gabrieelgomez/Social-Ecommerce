class Item < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  belongs_to :custom_field

  validates :product, :custom_field,
            :shopping_cart, presence: true
end
