# Api Module
module Api::V1::Sellers
  # Destroy Controller
  class DestroyController < SellersController
    before_action :authenticate_user!
    before_action :set_seller

    def destroy
      if @seller.destroy
        render json: @seller, status: :destroyed
      else
        render json: ErrorSerializer.serialize(@seller.errors)
      end
    end
  end
end
