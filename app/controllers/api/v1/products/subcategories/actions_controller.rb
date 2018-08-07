module Api::V1::Products::Subcategories
  class ActionsController < SubcategoriesController
    before_action :set_subcategory, only: [:update, :destroy]
    def create
      @subcategories = Subcategory.new(subcategories_params)
      if @subcategories.save
        render json: @subcategories, status: 200
      else
        render json: @subcategories.errors,
               status: 500
      end
    end

    def update
      if @subcategory.update(subcategories_params)
        render json: @subcategory, status: 200
      else
        render json: @subcategory.errors,
               status: 500
      end
    end

    def destroy
      if @subcategory.destroy
        render json: @subcategory, status: 200
      else
        render json: @subcategory.errors,
               status: 500
      end
    end
  end
end
