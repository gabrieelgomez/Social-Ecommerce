module Api::V1::WaveWork::TypeJobs
  class DestroyController < TypeJobsController
    before_action :set_type_job, only: %i[destroy]

    def destroy
      if @type_job.destroy
        render json: @type_job, status: 200
      else
        render json: @type_job.errors,
               status: 422
      end
    end

  end
end
