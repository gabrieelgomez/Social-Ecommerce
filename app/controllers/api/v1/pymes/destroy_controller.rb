# Api Module
module Api::V1::Pymes
  # Destroy Controller
  class DestroyController < PymesController
    before_action :authenticate_v1_user!
    before_action :validate_password, only: [:destroy]
    before_action :set_my_pyme, only: [:destroy]

    def destroy
      if @pyme.destroy
        render json: @pyme, status: 200
      else
        render json: ErrorSerializer.serialize(@pyme.errors)
      end
    end
  end
end
