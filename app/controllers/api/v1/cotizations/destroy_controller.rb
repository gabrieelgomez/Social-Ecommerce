module Api::V1::Cotizations
  # Destroy controller
  class DestroyController < CotizationsController

    def destroy
      if @cotization.destroy
        render json: @cotization, status: 200
      else
        render json: @cotization.errors,
               status: 500
      end
    end

  end
end
