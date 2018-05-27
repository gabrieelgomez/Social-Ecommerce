module Api::V1::Offers::SavedOffers
  # Show controller - get routes 
  class ShowController < SavedOffersController

    # Callbacks
    before_action :set_saved_offer, only: :show

    def show
      render json: @saved_offer
    end

    def saved_offers_user
      @user = current_v1_user
      render json: @user.saved_offers
    end

    private

    def set_saved_offer
      @saved_offer = SavedOffers.find params[:saved_offer_id]
    end
  end
end
