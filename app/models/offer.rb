class Offer < ApplicationRecord
  # Relations
  has_and_belongs_to_many :products
  belongs_to :user
  # belongs_to :owners, class_name: 'User', foreign_key: 'saved_offer_id'
  has_one :location, as: :locatable
  has_many :saved_offers
  has_many :wishes, as: :wisheable

  after_create :create_notify

  def not_mine?(user)
    self.user != user
  end

  def create_notify
    # notifiable = self.wisheable.productable.user
  	# notify = self.user
		# notifiable.notify metadata: {
    #   title: "#{notify.name} ha deseado tu producto #{self.wisheable.name}"
    # }
  end

end
