module Api::V1
  class Sellers::SellersController < ApiController

    private

    def set_seller
      @seller = Seller.where(type_profile: 'seller').find(params[:id])
    end

    def seller_params
      params.permit(:user_id, :title, :name)
    end

    def validate_current_seller
      seller = Seller.where(user_id: current_v1_user.id, type_profile: 'seller')
      return render json: { errors: "Access denied" } if seller.first.id != params[:id].to_i
    end
  end
end
