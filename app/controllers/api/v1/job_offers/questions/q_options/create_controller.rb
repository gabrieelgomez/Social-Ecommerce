module Api::V1::JobOffers::Questions::QOptions
  class CreateController < QOptionsController
    before_action :authenticate_v1_user!   ,  only: %i[create]
    before_action :set_current_user_profile,  only: %i[create]
    before_action :set_job_offers_of_profile, only: %i[create]
    before_action :set_question,              only: %i[create]

    def create
      @option = QOption.new(q_option_params)
      if @option.save
        render json: @option, status: 200
      else
        render json: @option.errors, status: 500
      end
    end
  end
end
