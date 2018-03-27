module Api::V1
	class Products::Categories::CategoriesController < ApiController
		before_action :authenticate_user!
		
		private

		def categories_params
			params.require(:categories).permit(:name)
		end

		def set_category
			@category = Category.find(params[:category_id])
		end

		def set_categories
			@categories = Category.all
		end

	end
end
