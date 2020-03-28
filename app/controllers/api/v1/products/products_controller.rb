module Api::V1
  class Products::ProductsController < ApiController
    before_action :authenticate_v1_user!, only: [:wished]
    before_action :set_product, only: %i[status]

    include ::Api::V1::Concerns::ProductSearch
    include ::Api::V1::Concerns::ModelModulation

    def wished
      @wish = Wish.find_by_wisheable_type_and_wisheable_id_and_user_id('Product', params[:id], current_v1_user.id)

      if @wish #update status
        render json: true, status: 200
      else
        render json: false, status: 200
      end

    end

    # PUT /v1/products/:id/status
    def status
      if @product.update(status: !@product.status) #update status
        render json: @product.as_json(only: %i[id type name status]), status: 200
      else
        render json: @product.errors,
               status: 422
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end

  end
end
