module Api::V1::JobOffers
  class CreateController < JobOffersController
    before_action :authenticate_v1_user!,    only: %i[create]
    before_action :set_current_user_profile, only: %i[create]

    def create
      @job_offer = @profile.job_offers.new(job_offer_params)
      if @job_offer.save
        render json: @job_offer, status: 200
      else
        render json: @job_offer.errors, status: 500
      end
    end
  end
end
