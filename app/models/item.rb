class Item < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  has_and_belongs_to_many :custom_fields

  validates :product, :custom_field_ids,
            :shopping_cart, presence: true
end
