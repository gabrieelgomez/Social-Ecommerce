module Api::V1::Products
	class ActionController < ProductsController
		before_action :authenticate_v1_user!
		before_action :current_user_productable
		before_action :set_product, only: [:destroy, :update]


		def create
			@product = @productable.products.new(product_params)
			@product.category_ids = params[:product][:category_ids]
			@product.tag_list.add(params[:product][:tags])
			if @product.save
				render json:{
					status: 'success',
	        data:   model_name.where(id: @productable.id).as_json(
						root: true,
						include: {
							products: {
								include: {
									tags: {},
									price_ranges: {},
									options:{},
									custom_fields:{},
									categories:{}
								}
							}
						}
					)
				}
			else
				render json: ErrorSerializer.serialize(@product.errors)
			end
		end

		def update
			category_ids = params[:product][:category_ids]
			@product.category_ids = category_ids if !category_ids.nil?
			@product.tag_list.add(params[:product][:tags])
			if @product.update(product_params)
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
