module Api::V1::WaveEducational::Exams
  class TypeQuestions::TypeQuestionsController < ExamsController

    private

    def set_type_question
      @type_question = WaveEducational::TypeQuestion.find(params[:type_question_id])
    end

    def type_question_params
      params.require(:type_question).permit(:title, :question_type, :question, :open_answer, :boolean_answer, alternative_answer: [])
    end

  end
end
