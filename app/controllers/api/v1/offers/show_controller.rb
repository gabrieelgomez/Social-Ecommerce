module Api::V1::Offers
  class ShowController < OffersController
    # before_action :authenticate_v1_user!
    # before_action :offer_params, only: [:create]
    before_action :set_offer, only: [:show]
    def index
      @offers = Offer.all
      render json: @offers
    end

    def show
      render json: @offer
    end
  end
end