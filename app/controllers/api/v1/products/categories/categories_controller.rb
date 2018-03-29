module Api::V1::Products
	class Categories::CategoriesController < ProductsController
		before_action :authenticate_v1_user!

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
