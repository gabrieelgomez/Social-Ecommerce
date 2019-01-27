module Api::V1::WaveWork::TypeJobs
  class CreateController < TypeJobsController

    def create
      @type_job = WaveWork::TypeJob.new(type_job_params)
      if @type_job.save
        render json: @type_job, status: 201
      else
        render json: @type_job.errors,
               status: 500
      end
    end

  end
end
