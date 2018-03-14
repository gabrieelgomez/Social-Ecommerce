module Api::V1::Sellers
  # Update controller
  class UpdateController < SellersController
    before_action :authenticate_user!
    before_action :set_seller
    before_action :seller_params

    def update
      if @seller.update(seller_params)
        render json: @seller, status: :updated
      else
        render json: ErrorSerializer.serialize(@seller.errors)
      end
    end
  end
end
