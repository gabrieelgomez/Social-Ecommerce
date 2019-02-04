module Api::V1::WaveWork::Workers
  class ShowController < WorkersController
    before_action :set_worker, only: [:show]

    def index
      render json: WaveWork::Worker.all.order(id: :asc), status: 200
    end

    def show
      render json: @worker, status: 200
    end

  end
end
