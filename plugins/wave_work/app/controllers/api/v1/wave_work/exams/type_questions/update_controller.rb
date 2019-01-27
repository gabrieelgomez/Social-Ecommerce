module Api::V1::WaveWork::Exams::TypeQuestions
  class UpdateController < TypeQuestionsController
    before_action :set_type_question, only: %i[update]

    def update
      if @type_question.update(type_question_params)
        render json: @type_question, status: 200
      else
        render json: @type_question.errors,
               status: 500
      end
    end

  end
end
