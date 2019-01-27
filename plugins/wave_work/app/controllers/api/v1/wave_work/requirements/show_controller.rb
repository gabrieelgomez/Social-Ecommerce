module Api::V1::WaveWork::Requirements
  class ShowController < RequirementsController
    before_action :set_job_offer, only: %i[index_per_job_offer]
    before_action :set_requirement, only: %i[show]

    def index
      render json: WaveWork::Requirement.all.order(id: :asc), status: 200
    end

    def show
      render json: @requirement, status: 200
    end

    def index_per_job_offer
      @requirements = @job_offer.requirements
      render json: @requirements, status: 200
    end

  end
end
