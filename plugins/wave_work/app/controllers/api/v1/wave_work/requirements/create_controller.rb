module Api::V1::WaveWork::Requirements
  class CreateController < RequirementsController
    before_action :set_job_offer, only: %i[create]

    def create
      @requirement = @job_offer.requirements.new(requirement_params)
      if @requirement.save
        render json: @requirement, status: 200
      else
        render json: @requirement.errors, status: 500
      end
    end

  end
end
