class Offer < ApplicationRecord
  # Relations
  has_and_belongs_to_many :products
  belongs_to :user
  # belongs_to :owners, class_name: 'User', foreign_key: 'saved_offer_id'
  has_one :location, as: :locatable
  has_many :saved_offers

  def not_mine?(user)
    self.user != user
  end
end
