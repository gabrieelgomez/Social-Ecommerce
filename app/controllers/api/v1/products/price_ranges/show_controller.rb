module Api::V1::Products::PriceRanges
	class ShowController < PriceRangesController
		before_action :public_productable
		before_action :set_product_range

		def index
			render json:{
				status: 'success',
        data:   @product.price_ranges.as_json(
					root: true,
					include: {
						product: {}
					}
				)
			}
		end
	end
end
