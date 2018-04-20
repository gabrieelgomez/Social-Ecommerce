module Api::V1::Products
	class Subcategories::SubcategoriesController < ProductsController
		before_action :authenticate_v1_user!

		private

		def subcategories_params
			params.require(:subcategories).permit(:name)
		end

		def set_subcategory
			@subcategory = Subcategory.find(params[:subcategory_id])
		end

		def set_subcategories
			@subcategories = Subcategory.all
		end

	end
end
