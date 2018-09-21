module Api::V1::Products::PriceRanges
	class ShowController < PriceRangesController
		before_action :public_productable
		before_action :set_product_range

		def index
			render json: @product.price_ranges, status: 200
		end
	end
end
