module Api::V1::WaveWork::Exams::TypeQuestions
  class DestroyController < TypeQuestionsController
    before_action :set_type_question, only: %i[destroy]

    def destroy
      if @type_question.destroy
        render json: @type_question, status: 200
      else
        render json: @type_question.errors,
               status: 500
      end
    end

  end
end
