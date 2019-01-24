module Api::V1::WaveEducational::Teachers::Courses
  class UpdateController < CoursesController
    before_action :set_course, only: %i[update]

    def update
      if @course.update(course_params)
        render json: @course, status: 200
      else
        render json: @course.errors,
               status: 500
      end
    end

  end
end
