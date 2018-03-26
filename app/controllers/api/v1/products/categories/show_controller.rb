module Api::V1::Products::Categories
	class ShowController < CategoriesController

		def index
			render json:{
				status: 'success',
				data:   @categories
			}
		end

	end
end
