module Api::V1
  class Categories::CategoriesController < ApiController
    # before_action :authenticate_v1_user!, except: [:index, :show]
    # before_action :set_category, only: [:update, :destroy, :show]
    before_action :set_category, only: [:show]

    private

    def category_params
      params.require(:categories).permit(:name)
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

  end
end
