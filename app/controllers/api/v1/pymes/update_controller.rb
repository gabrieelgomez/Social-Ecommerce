module Api::V1::Pymes
  # Update controller
  class UpdateController < PymesController
    before_action :authenticate_v1_user!
    before_action :set_my_pyme, only: %i[update]

    def update
      # title_will_change if @
      if @pyme.update(general_params(:pyme))
        render json: @pyme, status: 200
      else
        render json: @pyme.errors, status: 500
      end
    end
  end
end
