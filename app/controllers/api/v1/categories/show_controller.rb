module Api::V1::Categories
  class ShowController < CategoriesController

    def index
      @categories = Category.all
      render json: @categories
    end


    def show
      render json: @category, status: :show
    end

  end
end
