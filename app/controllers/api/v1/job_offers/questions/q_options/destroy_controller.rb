module Api::V1::JobOffers::Questions::QOptions
  class DestroyController < QOptionsController
    before_action :authenticate_v1_user!    , only: %i[destroy]
    before_action :set_current_user_profile , only: %i[destroy]
    before_action :set_job_offers_of_profile, only: %i[destroy]
    before_action :set_question             , only: %i[destroy]
    before_action :set_option               , only: %i[destroy]


    def destroy
      if @option.destroy
        render json: @option, status: 200
      else
        render json: @option.errors, status: 422
      end
    end
  end
end
