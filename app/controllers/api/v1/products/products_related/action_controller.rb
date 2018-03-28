module Api::V1::Products::ProductsRelated
	class ActionController < ProductsRelatedController
		before_action :authenticate_v1_user!
		before_action :current_user_productable, only: [:create]
		# before_action :set_product, only: [:create]

		def create
			@product = @productable.products.find(params[:product_id])
			ids = params[:products]
			reals = @productable.products.map(&:id)
			present_prod = ids.select { |n| reals.include?(n) }
			if @product.update(product_relations: present_prod)
				render json: { 
					status: 'success',
					data: @product
				}
			else
				render json: {
					status: 'error',
	        data:   @product,
	        errors: @product.errors
				}
			end
		end
	end
end