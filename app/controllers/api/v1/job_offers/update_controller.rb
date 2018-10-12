module Api::V1::JobOffers
  class UpdateController < JobOffersController
    before_action :authenticate_v1_user!,     only: %i[update]
    before_action :set_current_user_profile,  only: %i[update]
    before_action :set_job_offers_of_profile, only: %i[update]

    def update
      if @job_offer.update(job_offer_params)
        render json: @job_offer, status: 200
      else
        render json: @job_offer.errors, status: 500
      end
    end
  end
end
