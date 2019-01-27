module Api::V1::WaveWork
  class JobOffers::JobOffersController < WaveWorkController
    before_action :set_current_user_profile, only: %i[create update destroy]

    private

    # Setting a specific job offer
    def set_job_offer
      @job_offer = custom_find do
        WaveWork::JobOffer.find(params[:job_offer_id])
      end
    end

    # Setting a job offer of a specific profile
    def set_job_offers_of_profile
      @job_offer = custom_find do
        @profile.job_offers.find(params[:job_offer_id])
      end
    end

    # Setting a specific profile
    def set_current_user_profile
      @profile = custom_find do
        current_v1_user.profiles.find(params[:profile_id])
      end
    end

    # Set profile
    def set_profile
      @profile = custom_find do
        Profile.find(params[:profile_id])
      end
    end

    def job_offer_params
      params.require(:job_offer).permit(:title, :description, :country, :state,
                                        :address, :vacancies, :copy_cv,
                                        :profile_id, :area_id,
                                        :type_hierarchy_id, :type_job_id)
    end

  end
end
