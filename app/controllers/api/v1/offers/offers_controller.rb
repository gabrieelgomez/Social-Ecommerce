module Api::V1
  class Offers::OffersController < ApiController
    include Concerns::ModelModulation
    private

    def offer_params
      params.require(:offer).permit(:title, :description, :start_time, :end_time, :product_ids, 
                                    :user_id, :state, :price, :stock, :condition, :included)
    end

    def set_profile_of_user
      user = current_v1_user
      @profile = model_name.find('id = ? and user_id = ?', params[:profile_id], user.id)
    end

    def set_profile
      @profile = model_name.find(params[:profile_id])
    end

    def set_offer
      @offer = Offer.find(params[:id])
    end
  end
end