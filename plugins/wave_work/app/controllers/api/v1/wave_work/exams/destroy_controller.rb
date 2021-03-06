module Api::V1::WaveWork::Exams
  class DestroyController < ExamsController
    before_action :set_exam, only: %i[destroy]

    def destroy
      if @exam.destroy
        render json: @exam, status: 200
      else
        render json: @exam.errors,
               status: 422
      end
    end

  end
end
