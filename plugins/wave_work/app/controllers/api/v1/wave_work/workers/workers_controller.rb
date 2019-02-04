module Api::V1::WaveWork
  class Workers::WorkersController < WaveWorkController
    
    private

    def set_worker
      @worker = WaveWork::Worker.find(params[:worker_id])
    end

    def worker_params
      params.require(:worker).permit(:title)
    end

  end
end
