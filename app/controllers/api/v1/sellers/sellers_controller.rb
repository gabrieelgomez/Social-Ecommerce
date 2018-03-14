module Api::V1
  class Sellers::SellersController < ApiController

    private

    def set_seller
      @seller = Seller.where(type_profile: 'seller').find(params[:id])
    end

    def seller_params
      params.permit(:user_id, :title, :name)
    end
  end
end
