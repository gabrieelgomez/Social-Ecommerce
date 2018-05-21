module Api::V1::SavedOffers
  class CreateController < SavedOffersController
    before_action :set_offer
    before_action :set_and_verify_offer

    def add
      @saved_offer = SavedOffer.find_or_create_by(
        user: current_v1_user, 
        offer: @offer
      )
      # byebug
      render json: @saved_offer
    end
  end
end