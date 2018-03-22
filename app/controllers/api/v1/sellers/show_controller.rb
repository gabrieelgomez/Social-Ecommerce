module Api::V1::Sellers
  # Show controller
  class ShowController < SellersController
    # Callbacks
    before_action :authenticate_user!, only: :own_sellers
    before_action :set_seller, only: :show


    # Public methods
    def index
      render json: Seller.where(type_profile: 'seller')
    end

    # def show
    #   render json: @seller
    # end

    def own_sellers
      render json: {
        status: 'success',
        data:   seller = User.where(id: current_user.id).as_json(root: true, include: :seller)
      }
    end
  end
end
