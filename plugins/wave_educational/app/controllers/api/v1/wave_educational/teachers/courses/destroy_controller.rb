module Api::V1::WaveEducational::Teachers::Courses
  class DestroyController < CoursesController
    before_action :set_course, only: %i[destroy]

    def destroy
      if @course.destroy
        render json: @course, status: 200
      else
        render json: @course.errors,
               status: 500
      end
    end

  end
end
