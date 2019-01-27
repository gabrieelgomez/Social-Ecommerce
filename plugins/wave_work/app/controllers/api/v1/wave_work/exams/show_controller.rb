module Api::V1::WaveWork::Exams
  class ShowController < ExamsController
    before_action :set_examenable, only: [:index]
    before_action :set_exam, only: [:show]

    def index
      render json: @examenable.exams.order(id: :asc), status: 200
    end

    def show
      render json: @exam, status: 200
    end

  end
end
