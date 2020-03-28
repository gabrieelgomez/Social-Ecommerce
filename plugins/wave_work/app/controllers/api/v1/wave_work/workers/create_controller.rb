module Api::V1::WaveWork::Workers
  class CreateController < WorkersController

    def create
      @worker = WaveWork::Worker.new(worker_params)
      if @worker.save
        render json: @worker, status: 200
      else
        render json: @worker.errors,
               status: 422
      end
    end

  end
end
