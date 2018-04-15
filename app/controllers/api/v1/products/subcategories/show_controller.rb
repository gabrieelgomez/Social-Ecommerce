module Api::V1::Products::Subcategories
	class ShowController < SubcategoriesController
		before_action :set_subcategories, only: [:index]
		before_action :set_subcategory, only: [:show]

		def index
			render json:{
				status: 'success',
				data:   @subcategories
			}
		end

		def show
			render json:{
				status: 'success',
				data:   @subcategory
			}
		end

	end
end
