module Api::V1::JobOffers::Questions
  class QOptions::QOptionsController < QuestionsController

    private

    def q_option_params
      params.require(:q_option)
            .permit(:name, :position)
            .merge(question: @question)
    end

    def set_option
      @option = custom_find do
        @question.options.find(params[:option_id])
      end
    end
  end
end
