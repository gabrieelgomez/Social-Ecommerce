module Api::V1::JobOffers::Questions::QOptions
  class UpdateController < QOptionsController
    before_action :authenticate_v1_user!    , only: %i[update]
    before_action :set_current_user_profile , only: %i[update]
    before_action :set_job_offers_of_profile, only: %i[update]
    before_action :set_question             , only: %i[update]
    before_action :set_option               , only: %i[update]

    def update
      if @option.update(q_option_params)
        render json: @option, status: 200
      else
        render json: @option.errors, status: 500
      end
    end
  end
end
