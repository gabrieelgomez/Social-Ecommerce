class Product < ApplicationRecord
	# mount_uploader :images, ImagesUploader
	after_create :create_notify


	acts_as_taggable_on :tags
	has_many :price_ranges
	has_and_belongs_to_many :custom_fields
	has_and_belongs_to_many :options
	has_and_belongs_to_many :subcategories
	has_and_belongs_to_many :offers
	belongs_to :productable, polymorphic: true

	validates :name, presence: true

	# scope :public_productable, -> (model_name, profile_id, type_profile) {
	# }

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

end
