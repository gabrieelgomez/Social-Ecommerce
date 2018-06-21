module Api::V1
  class ShoppingCarts::ShoppingCartsController < ApiController
    before_action :authenticate_v1_user!

    private

    def set_option
      @option = custom_find do
        @product.productable.options.find(params[:option_id])
      end
      @option_value = @option.values[params[:option_value]]
      rescue_not_found('Option') if @option_value.nil?
    end

    def set_custom_field
      @custom_field = custom_find do
        @product.custom_fields
                .find(params[:custom_field])
      end
    end

    def set_product
      @product = custom_find do
        Product.find(params[:product_id])
      end
    end

    def set_shopping_cart
      @shopping_cart = current_v1_user.shopping_cart
    end
  end
end
