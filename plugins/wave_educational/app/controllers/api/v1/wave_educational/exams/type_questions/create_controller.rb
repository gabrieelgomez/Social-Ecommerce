module Api::V1::WaveEducational::Exams::TypeQuestions
  class CreateController < TypeQuestionsController
    before_action :set_exam, only: [:create]

    def create
      @type_question = WaveEducational::TypeQuestion.new(type_question_params)
      @type_question.exam = @exam
      if @type_question.save
        render json: @type_question, status: 201
      else
        render json: @type_question.errors,
               status: 500
      end
    end

  end
end
