module Api::V1::Offers
  class DestroyController < OffersController
    before_action :authenticate_v1_user!, only: [:destroy]
    before_action :set_current_user_offer, only: [:destroy]

    def destroy
      if @offer.destroy
        render json: @offer, status: 200
      else 
        render json: @offer.errors, status: 500
      end
    end
  end
end
