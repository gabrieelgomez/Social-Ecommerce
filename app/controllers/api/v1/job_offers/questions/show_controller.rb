module Api::V1::JobOffers::Questions
  class ShowController < QuestionsController
    before_action :set_job_offer, only: %i[index show]

    def index
      @questions = @job_offer.questions
      render json: @questions, status: 200
    end

    def show
      @question = custom_find do
        @job_offer.questions.find(params[:question_id])
      end
      render json: @question, status: 200
    end
  end
end
