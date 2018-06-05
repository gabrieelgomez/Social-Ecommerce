class Offer < ApplicationRecord
  # Relations
  has_and_belongs_to_many :products
  belongs_to :user
  # belongs_to :owners, class_name: 'User', foreign_key: 'saved_offer_id'
  has_one :location, as: :locatable
  has_many :saved_offers
  has_many :wishes, as: :wisheable

  def not_mine?(user)
    self.user != user
  end

  def create_notify(profile, offer)
    model_name = profile.type_profile.capitalize
    followers = profile.followers_by_type_profile('User', model_name)
    return if followers.nil?
    followers.each do |follower|
      follower.notify metadata: {
        title: "#{profile.title} ha creado la oferta #{offer.title}"
      }
    end
  end
end
