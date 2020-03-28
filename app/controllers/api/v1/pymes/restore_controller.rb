module Api::V1::Pymes
  # Restore controller
  class RestoreController < PymesController
    before_action :authenticate_v1_user!
    
    def restore
      @pyme = current_v1_user.pymes.restore(params[:id])
      if @pyme
        render json: @pyme, status: 200
      else
        render json: @pyme.errors, status: 422
      end
    end
  end
end
