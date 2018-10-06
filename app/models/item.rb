class Item < ApplicationRecord
  acts_as_paranoid
  belongs_to :shopping_cart
  belongs_to :product
  has_and_belongs_to_many :custom_fields, optional: true
  has_and_belongs_to_many :options, optional: true

  validates :product,
            :shopping_cart, presence: true
end
