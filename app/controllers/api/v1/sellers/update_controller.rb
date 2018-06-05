module Api::V1::Sellers
  # Update controller
  class UpdateController < SellersController
    before_action :authenticate_v1_user!
    before_action :set_my_seller
    # before_action :seller_params
    # before_action :validate_current_seller

    def update
      if @seller.update(general_params(:seller))
        render json: @seller, status: 200
      else
        render json: @seller.errors, status: 500
      end
    end
  end
end
