module Api::V1::Concerns::ProductSearch
  extend ActiveSupport::Concern

  private

  def product_params
    params.require(:product).permit(:name, :images, :height, :cover,
                                    :prominent, :virtual_product, :width,
                                    :weight, :price, :rate, :stock, :num_ref,
                                    :status, :bar_code, :brand, :currency,
                                    :service_type, :description, :tags, files:[],
                                    subcategory_ids: [], product_relations: []) #add document_data as a permitted parameter
  end

  def set_product
    @product = @productable.products.find(params[:id])
  end

end

#
# ,
# multiple_images: [], document_data: []
