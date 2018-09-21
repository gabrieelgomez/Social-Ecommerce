module Api::V1::Products::Subcategories
  class ShowController < SubcategoriesController
    before_action :set_subcategories, only: %i[index]
    before_action :set_subcategory, only: %i[show subcat_products]

    def index
      render json: @subcategories, status: 200
    end

    def show
      render json: @subcategory, status: 200
    end

    def subcat_products
      @products = @subcategory.products
      render json: @products, status: 200
    end
  end
end
