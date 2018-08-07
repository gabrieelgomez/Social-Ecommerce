module Api::V1::Offers
  class SavedOffers::SavedOffersController < OffersController
    before_action :authenticate_v1_user!

    private

    def set_offer
      @offer = custom_find {
        Offer.find params[:offer_id]
      }
    end

    def set_and_verify_offer
      return @offer if @offer.not_mine?(current_v1_user)
      render json: {
        error: [
          'Cannot add your own offer'
        ]
      }, status: 402
    end
  end
end
