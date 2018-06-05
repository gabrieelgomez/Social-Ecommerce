module Api::V1::Independents
  # Restore controller
  class RestoreController < IndependentsController
    before_action :authenticate_v1_user!

    def restore
      @independent = Independent.restore(params[:id])
      if @independent
        render json: @independent, status: 200
      else
        render json: ErrorSerializer.serialize(@independent.errors),
               status: 500
      end
    end
  end
end
