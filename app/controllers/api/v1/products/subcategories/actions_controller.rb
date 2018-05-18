module Api::V1::Products::Subcategories
	class ActionsController < SubcategoriesController
		before_action :set_subcategory, only: [:update, :destroy]

		def create
			@subcategories = Subcategory.new(subcategories_params)
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
        render json: @subcategory, status: 200
      else
        render json: ErrorSerializer.serialize(@subcategory.errors)
      end
		end

		def destroy
    	if @subcategory.destroy
				render json:{
					status: 200,
					data:   @subcategory
				}
      else
        render json: ErrorSerializer.serialize(@subcategory.errors)
      end
		end

	end
end