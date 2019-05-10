module Api::V1
  class Cotizations::CotizationsController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_cotization, only: %i[show update destroy]
    include ::Api::V1::Concerns::ModelModulation

    private

    def set_cotization
      @cotization = Cotization.find(params[:cotization_id])
    end

    def cotization_params
      params.require(:cotization).permit(:stage, :price)
    end
  end
end
