module Api::V1::Sellers
  class CreateController < SellersController
    before_action :authenticate_user!

    # # POST /v1/sellers
    # def create
    #   @seller = Seller.new(seller_params)
    #
    #   if @seller.save
    #     render json: @seller, status: :created
    #   else
    #     render json: @seller.errors
    #   end
    # end
    #
    # private
    #
    # def seller_params
    #   params.permit(:user_id, :profile_id)
    # end

  end
end
