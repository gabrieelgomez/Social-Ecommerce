module Api::V1::WaveEducational::Teachers
  class UpdateController < TeachersController
    before_action :set_teacher, only: %i[update]

    def update
      if @teacher.update(teacher_params)
        render json: @teacher, status: 200
      else
        render json: @teacher.errors,
               status: 422
      end
    end
    
  end
end
