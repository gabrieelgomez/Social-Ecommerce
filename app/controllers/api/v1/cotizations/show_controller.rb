module Api::V1::Cotizations
  class ShowController < CotizationsController

    def index
      render json: @cotizations, status: 200

    end

    def show
      render json: @cotization, status: 200
    end

  end
end
