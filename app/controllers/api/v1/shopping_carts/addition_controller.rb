module Api::V1::ShoppingCarts
  class AdditionController < ShoppingCartsController
    before_action :set_product, only: %i[add_product]
    before_action :set_shopping_cart, only: %i[add_product]
    before_action :set_custom_field, only: %i[add_product]
    before_action :set_option, only: %i[add_product]

    def add_product
      @item = @shopping_cart.items.new(product_id: @product.id,
                                       custom_field: @custom_field,
                                       option_id: @option.id,
                                       option_value: @option_value,
                                       quantity: params[:quantity])
      # Acomodar estos parámetros
      if @item.save
        render json: @shopping_cart, status: 200
      else
        render json: @shopping_cart.errors, status: 500
      end
    end
  end
end
