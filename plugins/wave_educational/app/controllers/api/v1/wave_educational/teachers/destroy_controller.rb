module Api::V1::WaveEducational::Teachers
  class DestroyController < TeachersController
    before_action :set_teacher, only: %i[destroy]

    def destroy
      if @teacher.destroy
        render json: @teacher, status: 200
      else
        render json: @teacher.errors,
               status: 422
      end
    end

  end
end
