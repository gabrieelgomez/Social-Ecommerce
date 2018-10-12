module Api::V1::JobOffers
  class Postulations::PostulationsController < JobOffersController

    private

    def set_postulation
      @postulation = custom_find do
        @job_offer.postulations.find(params[:postulation_id])
      end
    end
  end
end
