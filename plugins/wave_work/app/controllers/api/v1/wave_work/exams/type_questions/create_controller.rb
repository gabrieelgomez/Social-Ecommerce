module Api::V1::WaveWork::Exams::TypeQuestions
  class CreateController < TypeQuestionsController
    before_action :set_exam, only: [:create]

    def create
      @type_question = WaveWork::TypeQuestion.new(type_question_params)
      @type_question.exam = @exam
      if @type_question.save
        render json: @type_question, status: 200
      else
        render json: @type_question.errors,
               status: 422
      end
    end

  end
end
