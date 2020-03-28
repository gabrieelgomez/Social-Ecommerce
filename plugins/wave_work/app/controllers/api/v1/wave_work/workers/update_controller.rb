module Api::V1::WaveWork::Workers
  class UpdateController < WorkersController
    before_action :set_worker, only: %i[update]

    def update
      if @worker.update(worker_params)
        render json: @worker, status: 200
      else
        render json: @worker.errors,
               status: 422
      end
    end

  end
end
