module Api::V1::Independents
  # Update controller
  class UpdateController < IndependentsController
    before_action :authenticate_user!
    before_action :set_independent

    def update
      if @independent.update(general_params(:independent))
        render json: @independent, status: :updated
      else
        render json: ErrorSerializer.serialize(@independent.errors)
      end
    end
  end
end