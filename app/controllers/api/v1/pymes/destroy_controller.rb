# Api Module
module Api::V1::Pymes
  # Destroy Controller
  class DestroyController < PymesController
    before_action :authenticate_v1_user!
    before_action :validate_password, only: %i[destroy]
    before_action :set_my_pyme, only: %i[destroy]

    def destroy
      if @pyme.destroy
        render json: @pyme, status: 200
      else
        render json: @pyme.errors, status: 500
      end
    end
  end
end
