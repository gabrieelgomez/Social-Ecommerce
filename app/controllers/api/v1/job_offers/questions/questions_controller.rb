module Api::V1::JobOffers
  class Questions::QuestionsController < JobOffersController

    private

    def question_params
      params.require(:question).permit(
        :title, :description, :q_type, :position, :job_offer_id
      )
    end

    def set_question
      @question = custom_find do
        @job_offer.questions.find(params[:question_id])
      end
    end
  end
end
