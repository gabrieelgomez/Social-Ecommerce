module Api::V1::Sellers
  # Restore controller
  class RestoreController < SellersController
    before_action :authenticate_v1_user!

    def restore
      @seller = Seller.restore(params[:id])
      if @seller
        render json: @seller, status: 200
      else
        render json: ErrorSerializer.serialize(@seller.errors),
               status: 500
      end
    end
  end
end
