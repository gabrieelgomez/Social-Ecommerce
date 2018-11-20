module Api::V1
  class Products::ProductsController < ApiController
    before_action :set_product, only: %i[status]


    # PUT /v1/products/:id/status
    def status
      if @product.update(status: !@product.status) #update status
        render json: @product.as_json(only: %i[id type name status]), status: 200
      else
        render json: @product.errors,
               status: 500
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end

  end
end
