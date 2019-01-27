module Api::V1::WaveWork::TypeJobs
  class UpdateController < TypeJobsController
    before_action :set_type_job, only: %i[update]

    def update
      if @type_job.update(type_job_params)
        render json: @type_job, status: 200
      else
        render json: @type_job.errors,
               status: 500
      end
    end

  end
end
