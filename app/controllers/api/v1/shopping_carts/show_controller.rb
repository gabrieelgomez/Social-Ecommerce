module Api::V1::ShoppingCarts
  class ShowController < ShoppingCartsController
    def my_shop_cart
      @shop_cart = current_v1_user.shopping_cart
      render json: @shop_cart, status: 200
    end

    def show
      @shop_cart = current_v1_user.shopping_cart
      @item = custom_find { current_v1_user.shopping_cart.items.find params[:item_id] }
      render json: @item, status: 200
    end
  end
end
