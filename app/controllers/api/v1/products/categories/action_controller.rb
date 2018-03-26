module Api::V1::Products::Categories
	class ActionController < CategoriesController
		before_action :authenticate_user!
		before_action :set_category, only: [:update, :destroy]

		def create
			@categories = Category.new(categories_params)
      if @categories.save
				render json:{
					status: 'success',
					data:   @categories
				}
      else
        render json: ErrorSerializer.serialize(@categories.errors)
      end
		end

		def update
			if @category.update(categories_params)
        render json: @category, status: :updated
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
		end

		def destroy
    	if @category.destroy
				render json:{
					status: 'destroyed',
					data:   @category
				}
      else
        render json: ErrorSerializer.serialize(@category.errors)
      end
		end

	end
end
