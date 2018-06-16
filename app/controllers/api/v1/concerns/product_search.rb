module Api::V1::Concerns::ProductSearch
  extend ActiveSupport::Concern

  private

  def product_params
    params.require(:product).permit(:name, :images, :height, :files, :fields,
                                    :prominent, :virtual_product, :width,
                                    :weight, :price, :rate, :stock, :num_ref,
                                    :status, :bar_code, :brand, :currency,
                                    :service_type, :description, :tags,
                                    subcategory_ids: [], product_relations: [],
                                    document_data: []) #add document_data as a permitted parameter
  end

  def set_product
    @product = @productable.products.find(params[:id])
  end

end
