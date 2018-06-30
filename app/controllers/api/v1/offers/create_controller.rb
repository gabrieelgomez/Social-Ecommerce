module Api::V1::Offers
  class CreateController < OffersController
    before_action :authenticate_v1_user!
    before_action :offer_params, only: [:create]
    before_action :set_profile, only: [:create]
    before_action :current_user_productable

    def create
      @offer = Offer.new(offer_params)
      product_ids = params[:offer][:product_ids]
      # Make a lambda with this
      new_arr = product_ids.select{ |prof| @profile.products.map(&:id).include?(prof) }
      @offer.product_ids = new_arr
      @offer.user = current_v1_user
      if @offer.save
        @offer.create_notify(@profile, @offer)
        render json: @offer, status: 200
      else
        render json: @offer.errors, status: 500
      end
    end
  end
end
