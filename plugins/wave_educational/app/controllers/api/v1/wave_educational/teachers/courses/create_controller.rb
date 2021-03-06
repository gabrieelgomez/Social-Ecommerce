module Api::V1::WaveEducational::Teachers::Courses
  class CreateController < CoursesController
    before_action :set_teacher, only: [:create]

    def create
      @course = WaveEducational::Course.new(course_params)
      @course.teacher = @teacher
      if @course.save
        render json: @course, status: 200
      else
        render json: @course.errors,
               status: 422
      end
    end

  end
end
