module Api::V1::ShoppingCarts
  class ShowController < ShoppingCartsController
    def my_shop_cart
      @user = current_v1_user
      render json: @user.shopping_cart
    end
  end
end
