module Api::V1::WaveWork
  class Requirements::RequirementsController < WaveWorkController

    private

    # Setting a specific requirement
    def set_requirement
      @requirement = custom_find do
        WaveWork::Requirement.find(params[:requirement_id])
      end
    end

    # Set job_offer
    def set_job_offer
      @job_offer = custom_find do
        WaveWork::JobOffer.find(params[:job_offer_id])
      end
    end

    def requirement_params
      params.require(:requirement).permit(
        :start_age, :end_age, :address, :minimal_experience, :start_salary,
        :end_salary, :request_salary, sex: [], languages: [], education_level: []
      )
    end

  end
end
