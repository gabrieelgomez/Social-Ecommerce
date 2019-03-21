module Api::V1::Cotizations
  class ActionsController < CotizationsController

    # GET /v1/cotizations/current_user
    def current_user_cotizations
      @cotizations = current_v1_user.cotizations
      render json: @cotizations, status: 200
    end

  end
end
