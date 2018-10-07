module Api::V1::JobOffers::Questions
  class CreateController < QuestionsController
    before_action :authenticate_v1_user!,       only: %i[create]
    before_action :set_current_user_profile,    only: %i[create]
    before_action :set_job_offers_of_profile,   only: %i[create]

    def create
      @question = @job_offer.questions.new(question_params)
      if @question.save
        render json: @question, status: 200
      else
        render json: @question.errors, status: 500
      end
    end
  end
end
