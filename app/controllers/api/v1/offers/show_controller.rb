module Api::V1::Offers
  class ShowController < OffersController
    before_action :authenticate_v1_user!, only: [:current_user_offers]
    # before_action :offer_params, only: [:create]
    before_action :set_offer, only: [:show]
    def index
      @offers = Offer.all
      render json: @offers
    end

    def show
      render json: @offer
    end

    def current_user_offers
      @user = current_v1_user
      render json: @user
    end

    def user_offers
      @user = User.find_by(nickname: params[:username])
      render json: @user.nil? ? { message: 'Not found', status: 404 } : @user
    end
  end
end
