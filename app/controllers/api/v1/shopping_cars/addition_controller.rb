module Api::V1::ShoppingCars
  class AdditionController < ShoppingCarsController
    before_action :set_product, only: %i[add_product]
    before_action :set_shopping_car, only: %i[add_product]

    def add_product
      @shopping_car.products.push @product
      render json: @shopping_car, status: 200
    end
  end
end
