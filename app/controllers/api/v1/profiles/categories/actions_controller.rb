module Api::V1::Profiles::Categories
  class ActionsController < CategoriesController
    before_action :authenticate_v1_user!
    before_action :verify_superadmin_rol

    def create
      @category = Category.new(category_params)
      if @category.save
        render json: @category
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
    end

    def update
      if @category.update(category_params)
        render json: @category, status: 200
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
    end

    def destroy
      if @category.destroy
        render json: @category, status: 200
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
    end
  end
end
