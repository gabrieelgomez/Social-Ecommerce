module Api::V1::WaveWork::Requirements
  class DestroyController < RequirementsController
    before_action :set_requirement, only: %i[destroy]

    def destroy
      if @requirement.destroy
        render json: @requirement, status: 200
      else
        render json: @requirement.errors,
               status: 422
      end
    end

  end
end
