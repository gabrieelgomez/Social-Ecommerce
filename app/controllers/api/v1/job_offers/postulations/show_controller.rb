module Api::V1::JobOffers::Postulations
  class ShowController < PostulationsController
    before_action :authenticate_v1_user!, only: %i[index]
    before_action :set_job_offer        , only: %i[index show]
    before_action :set_postulation      , only: %i[show]

    def index
      @postulations = @job_offer.postulations
      render json: @postulations, status: 200
    end

    def show
      render json: @postulation, status: 200
    end
  end
end
