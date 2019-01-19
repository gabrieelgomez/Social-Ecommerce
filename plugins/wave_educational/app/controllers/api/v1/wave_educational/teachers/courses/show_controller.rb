module Api::V1::WaveEducational::Teachers::Courses
  class ShowController < CoursesController
    before_action :set_teacher, only: [:index]
    before_action :set_course, only: [:show]

    # Public methods
    def index
      render json: @teacher.courses.order(id: :asc), status: 200
    end

    def show
      render json: @course, status: 200
    end

  end
end
