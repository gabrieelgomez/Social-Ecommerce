module Api::V1
  class Offers::OffersController < ApiController
    include Concerns::ModelModulation
    private

    def offer_params
      params.require(:offer).permit(:title, :description, :start_time, :end_time,
                                    :user_id, :state, :price, :stock,
                                    :condition, :included, product_ids: [])
    end

    def set_profile_of_user
      user = current_v1_user
      @profile = model_name.find('id = ? and user_id = ?',
                                 params[:profile_id], user.id)
    end

    def set_profile
      @profile = custom_find { model_name.find(params[:profile_id]) }
    end

    def set_offer
      @offer = custom_find { Offer.find(params[:id]) }
    end

    def set_current_user_offer
      @offer = custom_find { current_v1_user.offers.find(params[:id]) }
    end
  end
end
