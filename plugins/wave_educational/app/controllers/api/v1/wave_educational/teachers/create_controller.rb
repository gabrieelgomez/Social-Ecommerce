module Api::V1::WaveEducational::Teachers
  class CreateController < TeachersController

    def create
      @teacher = WaveEducational::Teacher.new(teacher_params)
      @teacher.user = current_v1_user
      if @teacher.save
        render json: @teacher, status: 201
      else
        render json: @teacher.errors,
               status: 500
      end
    end

    private

    def teacher_params
      params.require(:teacher).permit(:user_id, :slug, :name, :type_teacher,
                                      :email, :banner, :photo, :launched, :phone,
                                      :url, :address, :vision, :mission, :description,
                                      :web, :teacher, :experience, :country, :validation)
    end
  end
end
