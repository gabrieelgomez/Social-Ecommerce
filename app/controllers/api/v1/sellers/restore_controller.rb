module Api::V1::Sellers
  # Restore controller
  class RestoreController < SellersController
    before_action :authenticate_v1_user!

    def restore
      seller = current_v1_user.deleted_seller.id
      # byebug
      @seller = Seller.restore(seller)
      if @seller
        render json: @seller, status: 200
      else
        render json: @seller.errors, status: 500
      end
    end
  end
end
