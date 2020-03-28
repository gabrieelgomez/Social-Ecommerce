module Api::V1::Offers::SavedOffers
  class DestroyController < SavedOffersController
    before_action :set_offer
    before_action :set_saved_offer

    def remove
      if @saved_offer.destroy
        render json: @saved_offer, status: 200
      else
        render json: @saved_offer.errors,
               status: 422
      end
    end

    private

    def set_saved_offer
      @saved_offer = custom_find { 
        SavedOffer.find_by_user_id_and_offer_id(
          current_v1_user.id,
          @offer.id
        )
      }
      # return @saved_offer unless @saved_offer.nil?
      # render json: {
      #   error: [
      #     'Record not found'
      #   ]
      # }, status: 404
    end
  end
end
