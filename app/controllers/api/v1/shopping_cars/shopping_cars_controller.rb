module Api::V1
  class ShoppingCars::ShoppingCarsController < ApiController
    before_action :authenticate_v1_user!

    private

    def set_product
      @product = custom_find { 
        Product.find(params[:product_id])
      }
    end

    def set_shopping_car
      @shopping_car = current_v1_user.shopping_car
    end
  end
end
