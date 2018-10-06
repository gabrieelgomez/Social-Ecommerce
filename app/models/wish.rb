class Wish < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :wisheable, polymorphic: true, optional: true
  has_one :sended_wish
  # State machine
  include AASM

  after_create :create_notify

  # Soft delete
  acts_as_paranoid

  scope :products, -> {where(wisheable_type: 'Product')}

  # aasm column: 'sent' do
  #   state :true, :false
  #   # state :low, initial: true
  #   # state :med, :high

  #   event :sent_wish do
  #     transitions from: :false, to: :true
  #   end

  #   # event :to_low do
  #   #   transitions from: %i[med high], to:
  #   # end
  # end

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

  def create_notify
    # recipient = self.wisheable.productable.user
  	# sender = self.user
    # message = "#{sender.name} ha deseado tu producto #{self.wisheable.name}"
    # #Method for create_notify, in order is recipient, sender, type, message
    # Notification.create_notify_models(recipient, sender, 'wish', message)
  end
end
