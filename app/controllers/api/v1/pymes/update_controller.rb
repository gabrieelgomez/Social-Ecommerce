module Api::V1::Pymes
  # Update controller
  class UpdateController < PymesController
    before_action :authenticate_v1_user!
    before_action :set_my_pyme, only: %i[update]

    def update
      if @pyme.update(general_params(:pyme))
        render json: @pyme, status: 200
      else
        render json: ErrorSerializer.serialize(@pyme.errors),
               status: 500
      end
    end
  end
end
