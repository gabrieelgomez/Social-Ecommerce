module Api::V1::ShoppingCars
  class SubtractionController < ShoppingCarsController

    # Callbacks
    before_action :set_product, only: %i[remove_product]
    before_action :set_shopping_car, only: %i[remove_product]

    def remove_product
      if @shopping_car.products.delete(@product.id)
        render json: @shopping_car, status: 200
      else
        render json: @shopping_car.errors, status: 500
      end
    end
  end
end
