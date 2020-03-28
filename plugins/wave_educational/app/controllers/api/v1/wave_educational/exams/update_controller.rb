module Api::V1::WaveEducational::Exams
  class UpdateController < ExamsController
    before_action :set_exam, only: %i[update]

    def update
      if @exam.update(exam_params)
        render json: @exam, status: 200
      else
        render json: @exam.errors,
               status: 422
      end
    end

  end
end
