# Api Module
module Api::V1::Sellers
  # Destroy Controller
  class DestroyController < SellersController
    before_action :authenticate_v1_user!, only: %i[destroy]
    before_action :validate_password, only: %i[destroy]
    before_action :set_my_seller, only: %i[destroy]
    # before_action :validate_current_seller

    def destroy
      if @seller.destroy
        render json: @seller, status: 200
      else
        render json: @seller.errors, status: 422
      end
    end
  end
end
