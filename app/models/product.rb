class Product < ApplicationRecord
	belongs_to :productable, polymorphic: true

	has_many :custom_fields

	scope :public_productable, -> (model_name, profile_id, type_profile) {

	}
end
