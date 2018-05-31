class Wish < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :wisheable, polymorphic: true, optional: true
  has_one :sended_wish
  # State machine
  include AASM

  # Soft delete
  acts_as_paranoid

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

  def set_wish_sent
    update(sent: true)
  end

  def set_wish_replied
    update(response: true)
  end

  def mine?(user)
    self.user == user
  end
end
