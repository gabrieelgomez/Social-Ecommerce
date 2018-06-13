module Api::V1
  class ShoppingCarts::ShoppingCartsController < ApiController
    before_action :authenticate_v1_user!

    private

    def set_product
      @product = custom_find { 
        Product.find(params[:product_id])
      }
    end

    def set_shopping_cart
      @shopping_cart = current_v1_user.shopping_cart
    end
  end
end
