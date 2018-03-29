module Api::V1::Products::PriceRanges
	class ActionController < PriceRangesController
		before_action :authenticate_v1_user!
		before_action :current_user_productable
		before_action :set_product_range
		before_action :set_price_range, only: [:update, :destroy]

		def create
			@price_range = PriceRange.new(price_ranges_params)
			@price_range.product = @product
			if @price_range.save
				render json: {
	        status: 'created',
	        data:   price_range_data
	      }
			else
				render json: {
					status: 'error',
					data: @price_range.errors
				}
			end
		end

		def update
			if @price_range.update(price_ranges_params)
				render json: {
	        status: 'updated',
	        data:   price_range_data
	      }
			else
				render json: {
					status: 'error',
					data: @price_range.errors
				}
			end
		end

		def destroy
			if @price_range.destroy
				render json: {
	        status: 'destroyed',
	        data:   price_range_data
	      }
			else
				render json: {
					status: 'error',
					data: @price_range.errors
				}
			end
		end

		private

		def price_range_data
			@product.as_json(
      	root: true,
      	include: {
      		price_ranges: {}
      	}
      )
		end

		def price_range_structure(status, data)
			render json: {
        status: status,
        data:   data
      }
		end

		def set_price_range
			@price_range = @product.price_ranges.find(params[:price_range_id])
		end
	end
end
