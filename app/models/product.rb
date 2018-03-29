class Product < ApplicationRecord
	mount_uploader :images, ImagesUploader

	belongs_to :productable, polymorphic: true
	acts_as_taggable_on :tags
	has_many :custom_fields
	has_many :options
	has_and_belongs_to_many :categories
	has_many :price_ranges

	# scope :public_productable, -> (model_name, profile_id, type_profile) {
	# }
end
