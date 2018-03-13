module Api::V1::Sellers
  class ShowController < SellersController
    before_action :authenticate_user!

    # GET /v1/sellers/{id}
    def show
      render json: Seller.find(params[:id])
    end

  end
end
