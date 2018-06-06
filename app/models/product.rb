class Product < ApplicationRecord
  # mount_uploader :images, ImagesUploader
  after_create :create_notify
  after_save :set_change_price, if: :price_changed?

  acts_as_taggable_on :tags
  has_many :price_ranges
  has_and_belongs_to_many :custom_fields
  has_and_belongs_to_many :options
  has_and_belongs_to_many :subcategories
  has_and_belongs_to_many :offers
  belongs_to :productable, polymorphic: true
  has_many :wishes, as: :wisheable

  validates :name, :price, presence: true

  # scope :public_productable, -> (model_name, profile_id, type_profile) {
  # }
  # def productable_type=(sType)
  #   sType.classify.constantize.to_s
  # end

  def create_notify
    model_name = self.productable.type_profile.capitalize
    followers = self.productable.followers_by_type_profile('User', model_name)
    return if followers.nil?
    followers.each do |follower|
      follower.notify type: 'Product', metadata: {
        title: "#{self.productable.title} ha añadido el producto #{self.name}"
      }
    end
  end

  def set_change_price
    return if price_before_last_save.nil?
    if price < price_before_last_save
      whishes = self.wishes
      message = "#{self.name} ha bajado el precio de #{price_before_last_save} a #{price}"
      whishes.each do |wish|
        #Method for create_notify, in order is recipient, sender, type, message
        Notification.create_notify_models(wish.user, self, 'Product', message)
      end
    end
  end

end
