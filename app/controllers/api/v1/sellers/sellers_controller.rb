module Api::V1
  class Sellers::SellersController < ApiController

    private

    def set_seller
      @seller = custom_find{ Seller.find(params[:id]) }
    end

    def seller_params
      params.permit(:user_id, :title, :slug, :name)
    end

    def set_my_seller
      @seller = current_v1_user.seller
      return @seller unless @seller.nil?
      render json: {
        error: [
          'Record not found'
        ]
      }, status: 404
    end

    def validate_current_seller
      seller = Seller.where(user_id: current_v1_user.id, type_profile: 'Seller')
      return render json: { errors: "Access denied" } if seller.first.id != params[:id].to_i
    end
  end
end
