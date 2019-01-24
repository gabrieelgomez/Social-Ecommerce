module Api::V1::WaveEducational::Teachers
  class ShowController < TeachersController
    before_action :set_teacher, only: [:show]

    def index
      render json: WaveEducational::Teacher.all.order(id: :asc), status: 200
    end

    def show
      render json: @teacher, status: 200
    end

  end
end
