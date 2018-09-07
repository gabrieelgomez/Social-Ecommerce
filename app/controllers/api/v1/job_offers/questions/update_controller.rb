module Api::V1::JobOffers::Questions
  class UpdateController < QuestionsController
    before_action :authenticate_v1_user!, only: %i[update]
    before_action :set_current_user_profile, only: %i[update]
    before_action :set_job_offers_profile, only: %i[update]
    before_action :set_question, only: %i[update]

    def update
      if @question.update(question_params)
        render json: @question, status: 200
      else
        render json: @question.errors, status: 500
      end
    end
  end
end
