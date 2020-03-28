module Api::V1::WaveWork::JobOffers
  class CreateController < JobOffersController

    def create
      @job_offer = @profile.job_offers.new(job_offer_params)
      if @job_offer.save
        render json: @job_offer, status: 200
      else
        render json: @job_offer.errors, status: 422
      end
    end

  end
end
