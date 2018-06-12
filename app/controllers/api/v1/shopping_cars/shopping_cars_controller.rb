module Api::V1
  class ShoppingCars::ShoppingCarsController < ApiController
    before_action :authenticate_v1_user!
  end
end
