class Product < ApplicationRecord
	# mount_uploader :images, ImagesUploader

	acts_as_taggable_on :tags
	has_many :price_ranges
	has_and_belongs_to_many :custom_fields
	has_and_belongs_to_many :options
	has_and_belongs_to_many :subcategories
	has_and_belongs_to_many :offers
	belongs_to :productable, polymorphic: true

	# scope :public_productable, -> (model_name, profile_id, type_profile) {
	# }
end
