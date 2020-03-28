module Api::V1::WaveWork::Requirements
  class UpdateController < RequirementsController
    before_action :set_requirement, only: %i[update]

    def update
      if @requirement.update(requirement_params)
        render json: @requirement, status: 200
      else
        render json: @requirement.errors,
               status: 422
      end
    end

  end
end
