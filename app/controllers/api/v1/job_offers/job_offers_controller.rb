module Api::V1
  class JobOffers::JobOffersController < ApiController
    # before_action :authenticate_v1_user!

    private

    def job_offer_params
      params.require(:job_offer).permit(:photo, :charge, :location, :salary,
                                        :day_rutine_type, :job_type, :details,
                                        :profile_id)
    end

    # Setting a specific job offer
    def set_job_offer
      @job_offer = custom_find {
        JobOffer.find(params[:job_offer_id])
      }
    end

    # Setting a job offer of a specific profile
    def set_job_offers_profile
      @job_offer = custom_find {
        @profile.job_offers.find(params[:job_offer_id])
      }
    end

    # Setting a specific profile
    def set_profile
      @profile = custom_find {
        Profile.find(params[:profile_id])
      }
    end
  end
end
