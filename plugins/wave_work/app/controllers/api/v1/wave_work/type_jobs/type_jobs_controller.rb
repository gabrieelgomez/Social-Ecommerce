module Api::V1::WaveWork
  class TypeJobs::TypeJobsController < WaveWorkController
    before_action :verify_superadmin_rol, only: %i[create destroy update]

    private

    def set_type_job
      @type_job = WaveWork::TypeJob.find(params[:type_job_id])
    end

    def type_job_params
      params.require(:type_job).permit(:title)
    end

  end
end
