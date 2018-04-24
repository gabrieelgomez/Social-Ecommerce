module Api::V1
  class Categories::CategoriesController < ApiController
    before_action :set_category, only: [:update, :destroy, :show]

    def index
      @categories = Category.all
      render json: @categories
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        render json: @category
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
    end
    def show
      render json: @category, status: :show
    end

    def update
			if @category.update(category_params)
        render json: @category, status: :updated
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
		end

		def destroy
    	if @category.destroy
        render json: @category, status: :destroyed
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
		end

    private

    def category_params
      params.require(:categories).permit(:name)
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

  end
end
