module Api::V1::Concerns::ProductSearch
	extend ActiveSupport::Concern

	private

	def product_params
		params.require(:product).permit(:name, :images, :category_ids, :height, :width,
																		:weight, :price, { product_relations: [] }, :tags, :rate)
	end

	def set_product
		@product = @productable.products.find(params[:id])
	end

end
