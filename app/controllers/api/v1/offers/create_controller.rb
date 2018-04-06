module Api::V1::Offers
  class CreateController < OffersController
    before_action :authenticate_v1_user!
    before_action :offer_params, only: [:create]
    before_action :set_profile, only: [:create]
    before_action :current_user_productable

    def create
      byebug
      @offer = Offer.new(offer_params)
      product_ids = params[:offer][:product_ids]
      # Make a lambda with this
      new_arr = product_ids.select{ |prof| @profile.products.map(&:id).include?(prof) }
      @offer.product_ids = new_arr
      @offer.user = current_v1_user
      byebug
      if @offer.save
        render json: @offer
      else
        render json: @offer.errors
      end
    end
  end
end