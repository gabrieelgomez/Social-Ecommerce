module Api::V1::Products
	class ActionController < ProductsController
		before_action :authenticate_user!
		before_action :current_user_productable
		before_action :set_product, only: [:destroy, :update]


		def create
			@product = @productable.products.new(product_params)
			if @product.save
				render json:{
					status: 'success',
					data:  model_name.find(@productable.id).as_json(root: true, include: { products: {include: :custom_fields} })
				}
			else
				render json: ErrorSerializer.serialize(@product.errors)
			end
		end

		def update
			if @product.update(product_params)
				byebug
        render json: @product, status: :updated
      else
        render json: ErrorSerializer.serialize(@product.errors)
      end
		end

		def destroy
    	if @product.destroy
        render json: @product, status: :destroyed
      else
        render json: ErrorSerializer.serialize(@product.errors)
      end
		end
	end
end
