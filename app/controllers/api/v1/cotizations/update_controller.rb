module Api::V1::Cotizations
  # Update controller
  class UpdateController < CotizationsController

    def update
      if @cotization.update(cotization_params)
        render json: @cotization, status: 200
      else
        render json: @cotization.errors,
               status: 500
      end
    end

  end
end
