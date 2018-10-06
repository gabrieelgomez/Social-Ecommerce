module Api::V1::Profiles
	class Categories::CategoriesController < ProfilesController
    # before_action :authenticate_v1_user!, except: [:index, :show]
    # before_action :set_category, only: [:update, :destroy, :show]
    before_action :set_category, only: [:show]

		def set_categories_products
			@result = Category.all.select{|cat| cat.products.count > 0}
			render json: @result, status: 200
		end

    private

    def category_params
      params.require(:categories).permit(:cover, :name)
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

  end
end
