module Api::V1::Products::Subcategories
	class ActionController < SubcategoriesController
		before_action :authenticate_v1_user!
		before_action :set_subcategory, only: [:update, :destroy]

		def create
			@subcategories = Category.new(subcategories_params)
      if @subcategories.save
				render json:{
					status: 'success',
					data:   @subcategories
				}
      else
        render json: ErrorSerializer.serialize(@subcategories.errors)
      end
		end

		def update
			if @subcategory.update(subcategories_params)
        render json: @subcategory, status: :updated
      else
        render json: ErrorSerializer.serialize(@subcategory.errors)
      end
		end

		def destroy
    	if @subcategory.destroy
				render json:{
					status: 'destroyed',
					data:   @subcategory
				}
      else
        render json: ErrorSerializer.serialize(@subcategory.errors)
      end
		end

	end
end
