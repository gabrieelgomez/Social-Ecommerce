module Api::V1::JobOffers::Questions
  class DestroyController < QuestionsController
    before_action :authenticate_v1_user!,     only: %i[destroy]
    before_action :set_current_user_profile,  only: %i[destroy]
    before_action :set_job_offers_of_profile, only: %i[destroy]
    before_action :set_question,              only: %i[destroy]

    def destroy
      if @question.destroy
        render json: @question, status: 200
      else
        render json: @question.errors, status: 500
      end
    end
  end
end
