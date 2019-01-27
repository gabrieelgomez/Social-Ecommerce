module Api::V1::WaveWork::Exams::TypeQuestions
  class ShowController < TypeQuestionsController
    before_action :set_exam, only: [:index]
    before_action :set_type_question, only: [:show]

    # Public methods
    def index
      render json: @exam.type_questions.order(id: :asc), status: 200
    end

    def show
      render json: @type_question, status: 200
    end

  end
end
