# Api Module
module Api::V1::Independents
  # Destroy Controller
  class DestroyController < IndependentsController
    before_action :authenticate_v1_user!, only: [:destroy]
    before_action :validate_password, only: [:destroy]
    before_action :set_independent

    def destroy
      if @independent.destroy
        render json: @independent, status: :destroyed
      else
        render json: ErrorSerializer.serialize(@independent.errors)
      end
    end
  end
end
