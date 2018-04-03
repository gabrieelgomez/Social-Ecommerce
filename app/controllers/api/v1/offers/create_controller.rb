module Api::V1::Offers
  class CreateController < OffersController
    before_action :authenticate_v1_user!
    before_action :offer_params, only: [:create]
    def create
      @offer = Offer.new(offer_params)
      @offer.category_ids = params[:offer][:category_ids]
      if @offer.save
        render json: @offer
      else
        render json: @offer.errors
      end
    end
  end
end