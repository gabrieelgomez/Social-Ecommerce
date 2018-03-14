module Api::V1::Sellers
  # Show controller
  class ShowController < SellersController
    # Callbacks
    before_action :authenticate_user!, only: :show
    before_action :set_seller, only: :show


    # Public methods
    def index
      render json: Seller.where(type_profile: 'seller')
    end

    # def show
    #   render json: @seller
    # end

    def show
      seller = Seller.where(user_id: current_user.id, type_profile: 'seller')
      return render json: { errors: "acceso denegado" } if seller.first.id != params[:id].to_i
      render json: seller
    end
  end
end
