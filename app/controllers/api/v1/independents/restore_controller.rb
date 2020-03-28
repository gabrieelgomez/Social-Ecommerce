module Api::V1::Independents
  # Restore controller
  class RestoreController < IndependentsController
    before_action :authenticate_v1_user!

    def restore
      @independent = current_v1_user.independents.restore(params[:id])
      if @independent
        render json: @independent, status: 200
      else
        render json: @independent.errors,
               status: 422
      end
    end
  end
end
