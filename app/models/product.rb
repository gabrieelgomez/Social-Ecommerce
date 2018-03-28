class Product < ApplicationRecord
	belongs_to :productable, polymorphic: true
	acts_as_taggable_on :tags
	has_many :custom_fields
	has_many :custom_fields
	has_and_belongs_to_many :categories

	# scope :public_productable, -> (model_name, profile_id, type_profile) {
	# }
end
