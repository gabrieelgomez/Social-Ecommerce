module Api::V1::Sellers
  # Update controller
  class UpdateController < SellersController
    before_action :authenticate_user!
    before_action :set_seller
    before_action :seller_params
    before_action :validate_current_seller

    def update
      if @seller.update(general_params(:seller))
        render json: @seller, status: :updated
      else
        render json: ErrorSerializer.serialize(@seller.errors)
      end
    end
  end
end
