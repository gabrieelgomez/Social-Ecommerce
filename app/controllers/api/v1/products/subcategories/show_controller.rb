module Api::V1::Products::Subcategories
  class ShowController < SubcategoriesController
    before_action :set_subcategories, only: [:index]
    before_action :set_subcategory, only: [:show]
    
    def index
      render json: @subcategories, status: 200
    end

    def show
      render json: @subcategory, status: 200
    end

  end
end
