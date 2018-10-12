module Api::V1::JobOffers
  class ShowController < JobOffersController
    before_action :set_profile,   only: %i[index_per_profile]
    before_action :set_job_offer, only: %i[show complete_job_offer]

    def index
      @job_offers = JobOffer.all
      render json: @job_offers, status: 200      
    end

    def show
      render json: @job_offer, status: 200
    end

    def index_per_profile
      @job_offers = @profile.job_offers
      render json: @job_offers, status: 200
    end

    def complete_job_offer
      render json: @job_offer,
             serializer: CompleteStructureSerializer,
             status: 200
    end
  end
end
