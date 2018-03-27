module Api::V1::Pymes
  # Update controller
  class UpdateController < PymesController
    before_action :authenticate_v1_user!
    before_action :set_pyme, only: [:update]

    def update
      if @pyme.update(general_params(:pyme))
        render json: @pyme, status: :updated
      else
        render json: ErrorSerializer.serialize(@pyme.errors)
      end
    end
  end
end
