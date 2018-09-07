module Api::V1::Sellers
  # Show controller
  class ShowController < SellersController
    # Callbacks
    before_action :authenticate_v1_user!, only: %i[own_sellers]
    before_action :set_seller, only: %i[show]

    # Public methods
    def index
      render json: Seller.all,
             each_serializer: IndexSerializer,
             fields: fields,
             status: 200
    end

    def show
      render json: @seller, status: 200
    end

    def own_sellers
      render json: current_v1_user.seller,
             status: 200
    end

    private

    def fields
      return {
        sellers: params[:fields].split(',').map(&:to_sym)
      } if params[:fields]
      nil
    end
  end
end
