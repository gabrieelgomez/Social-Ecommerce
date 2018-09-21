module Api::V1::Offers::SavedOffers
  class CreateController < SavedOffersController
    before_action :set_offer
    before_action :set_and_verify_offer

    def add
      @saved_offer = SavedOffer.find_or_create_by(
        user: current_v1_user,
        offer: @offer
      )
      render json: @saved_offer, status: 200
    end
  end
end
