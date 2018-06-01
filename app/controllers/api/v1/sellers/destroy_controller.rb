# Api Module
module Api::V1::Sellers
  # Destroy Controller
  class DestroyController < SellersController
    before_action :authenticate_v1_user!, only: [:destroy]
    before_action :validate_password, only: [:destroy]
    before_action :set_my_seller, only: [:destroy]
    # before_action :validate_current_seller

    def destroy
      # byebug
      if @seller.destroy
        render json: @seller, status: 200
      else
        render json: ErrorSerializer.serialize(@seller.errors)
      end
    end
  end
end
