module Api::V1::Products::Subcategories
  class ActionsController < SubcategoriesController
    before_action :authenticate_v1_user!
    before_action :verify_superadmin_rol
    before_action :set_subcategory, only: [:update, :destroy]

    def create
      @subcategories = Subcategory.new(subcategories_params)
      if @subcategories.save
        render json: @subcategories, status: 200
      else
        render json: @subcategories.errors,
               status: 422
      end
    end

    def update
      if @subcategory.update(subcategories_params)
        render json: @subcategory, status: 200
      else
        render json: @subcategory.errors,
               status: 422
      end
    end

    def destroy
      if @subcategory.destroy
        render json: @subcategory, status: 200
      else
        render json: @subcategory.errors,
               status: 422
      end
    end
  end
end
