module Api::V1::ShoppingCars
  class ShowController < ShoppingCarsController
    def my_shop_car
      @user = current_v1_user
      render json: @user.shopping_car
    end
  end
end
