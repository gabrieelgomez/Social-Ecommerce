module Api::V1::Products::Categories
	class ShowController < CategoriesController
		before_action :set_categories, only: [:index]
		before_action :set_category, only: [:show]

		def index
			render json:{
				status: 'success',
				data:   @categories
			}
		end

		def show
			render json:{
				status: 'success',
				data:   @category
			}
		end

	end
end
