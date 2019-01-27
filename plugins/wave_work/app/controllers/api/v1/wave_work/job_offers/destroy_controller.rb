module Api::V1::WaveWork::JobOffers
  class DestroyController < JobOffersController
    # before_action :set_job_offer, only: %i[destroy]
    before_action :set_job_offers_of_profile, only: %i[destroy]

    def destroy
      if @job_offer.destroy
        render json: @job_offer, status: 200
      else
        render json: @job_offer.errors,
               status: 500
      end
    end

  end
end
