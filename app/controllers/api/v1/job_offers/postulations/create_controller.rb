module Api::V1::JobOffers::Postulations
  class CreateController < PostulationsController
    before_action :authenticate_v1_user!, only: %i[create]
    before_action :set_job_offer, only: %i[create]

    def create
      @postulation = PostulationService.create_structure(
        @job_offer,
        current_v1_user,
        params[:postulation]
      )

      render json: @postulation, status: 200
    end
  end
end
