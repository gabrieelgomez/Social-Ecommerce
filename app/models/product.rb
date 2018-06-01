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
			follower.notify metadata: {
	      title: "#{self.productable.title} ha añadido el producto #{self.name}"
	    }
		end
  end

	def set_change_price
		if price < price_before_last_save
			p 'hola'
		end
	end

end
