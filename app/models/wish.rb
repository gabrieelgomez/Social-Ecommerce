class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :wisheable, polymorphic: true, optional: true
  include AASM

  def self.creating(wish_params, params, current_user)
    wisheable = find_wisheable(params[:wish])
    wish = new(wish_params)
    wish.user = current_user
    wish.wisheable = wisheable
    wish
  end

  # Find wisheable
  def self.find_wisheable(wish)
    model = wish[:wisheable_type].try(:modelarize)
    model.try(:find, wish[:wisheable_id])
  end

  def is_mine?(user)
    self.user == user
  end
end
