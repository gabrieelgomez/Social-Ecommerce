module Api::V1::WaveWork::Workers
  class DestroyController < WorkersController
    before_action :set_worker, only: %i[destroy]

    def destroy
      if @worker.destroy
        render json: @worker, status: 200
      else
        render json: @worker.errors,
               status: 500
      end
    end

  end
end
