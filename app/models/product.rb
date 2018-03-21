class Product < ApplicationRecord
	belongs_to :productable, polymorphic: true 

	scope :public_productable, -> (model_name, profile_id, type_profile) {
		
	}
end
