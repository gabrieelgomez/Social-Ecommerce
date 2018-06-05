module Api::V1::Pymes
  # Restore controller
  class RestoreController < PymesController
    before_action :authenticate_v1_user!
    
    def restore
      @pyme = Pyme.restore(params[:id])
      if @pyme
        render json: @pyme, status: 200
      else
        render json: @pyme.errors, status: 500
      end
    end
  end
end
