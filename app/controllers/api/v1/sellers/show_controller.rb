module Api::V1::Sellers
  # Show controller
  class ShowController < SellersController
    # Callbacks
    before_action :authenticate_v1_user!, only: [:own_sellers]
    before_action :set_seller, only: [:show]


    # Public methods
    def index
      render json: Seller.all
    end

    def show
      render json: @seller
    end

    def own_sellers
      render json: current_v1_user.seller
    end
  end
end
