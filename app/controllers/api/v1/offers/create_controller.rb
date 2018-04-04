module Api::V1::Offers
  class CreateController < OffersController
    before_action :authenticate_v1_user!
    before_action :offer_params, only: [:create]

    def create
      @offer = Offer.new(offer_params)
      @offer.product_ids = params[:offer][:product_ids]
      @offer.user = current_v1_user
      if @offer.save
        render json: @offer
      else
        render json: @offer.errors
      end
    end
  end
end