module Api::V1::WaveWork::Workers
  class CreateController < WorkersController

    def create
      @worker = WaveWork::Worker.new(worker_params)
      if @worker.save
        render json: @worker, status: 201
      else
        render json: @worker.errors,
               status: 500
      end
    end

  end
end
