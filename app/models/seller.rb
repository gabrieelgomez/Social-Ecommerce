class Seller < ApplicationRecord
  has_one :user
  belongs_to :profile
end
