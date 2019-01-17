module Api::V1::WaveEducational::Teachers
  class UpdateController < TeachersController
    before_action :authenticate_v1_user!   , only: %i[change_type_teacher]
    before_action :validate_password       , only: %i[change_type_teacher]
    before_action :set_teacher_current_user, only: %i[change_type_teacher]

    def change_type_teacher
      @updated_teacher = @teacher.change_type(params[:type_teacher])
      if @updated_teacher
        render json: @updated_teacher, status: 200
      else
        render json: @updated_teacher.errors, status: 200
      end
    end

    private

    def set_teacher_current_user
      @teacher = custom_find do
        current_v1_user.teachers.find(params[:teacher_id])
      end
    end
  end
end
