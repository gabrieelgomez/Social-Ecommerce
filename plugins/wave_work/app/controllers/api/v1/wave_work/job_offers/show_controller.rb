module Api::V1::WaveWork::Areas
  class ShowController < AreasController
    before_action :set_area, only: [:show]

    def index
      # render json: @areaenable.areas.order(id: :asc), status: 200
    end

    def show
      render json: @area, status: 200
    end

  end
end
