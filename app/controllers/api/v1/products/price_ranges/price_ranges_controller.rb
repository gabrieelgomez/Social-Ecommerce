module Api::V1::Products
	class PriceRanges::PriceRangesController < ProductsController

		private 

		def price_ranges_params
			params.require(:price_range).permit(:stock, :price, :product_id)
		end

		def set_product_range
			@product = @productable.products.find(params[:product_id])
		end
	end
end
