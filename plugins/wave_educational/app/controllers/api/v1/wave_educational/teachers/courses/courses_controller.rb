module Api::V1::WaveEducational::Teachers
  class Courses::CoursesController < TeachersController

    private

    def set_teacher
      @teacher = WaveEducational::Teacher.find(params[:teacher_id])
    end

    def set_course
      @course = WaveEducational::Course.find(params[:course_id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :lasted_update, :status,
                                      :private, :published, :price, :requeriments, :category)
    end

  end
end
