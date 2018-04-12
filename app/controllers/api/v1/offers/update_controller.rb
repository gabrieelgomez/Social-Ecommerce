module Api::V1::Offers
  class UpdateController < OffersController
    before_action :authenticate_v1_user!
    before_action :set_current_user_offer
    # before_action :offer_params, only: [:create]
    # before_action :set_profile, only: [:create]
    # before_action :current_user_productable

    def update
      if @offer.update(offer_params)
        # byebug
        render json: @offer
      else
        render json: @offer.errors
      end
    end
  end
end