module Api::V1
  class Offers::OffersController < ApiController
    private 

    def offer_params
      params.require(:offer).permit(:name, :description, :start_time, :end_time, :product_ids)
    end
  end
end