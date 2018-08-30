module Api::V1::JobOffers
  class UpdateController < JobOffersController
    before_action :set_profile, only: %i[update]
    before_action :set_job_offers_profile, only: %i[update]

    def update
      if @job_offer.update(job_offer_params)
        render json: @job_offer, status: 200
      else
        render json: @job_offer.errors, status: 500
      end
    end
  end
end
