module Api::V1::WaveWork::TypeJobs
  class ShowController < TypeJobsController
    before_action :set_type_job, only: [:show]

    def index
      render json: WaveWork::TypeJob.all.order(id: :asc), status: 200
    end

    def show
      render json: @type_job, status: 200
    end

  end
end
