module Api::V1::Products
	class Subcategories::SubcategoriesController < ProductsController
		before_action :authenticate_v1_user!

		private

		def subcategories_params
			params.require(:subcategories).permit(:name)
		end

		def set_subcategory
			@subcategory = Category.find(params[:subcategory_id])
		end

		def set_subcategories
			@subcategories = Category.all
		end

	end
end
