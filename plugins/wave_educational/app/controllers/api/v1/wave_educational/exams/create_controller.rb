module Api::V1::WaveEducational::Exams
  class CreateController < ExamsController
    before_action :set_examenable, only: %i[create]


    def create
      @exam = WaveEducational::Exam.new(exam_params)
      @exam.examenable = @examenable
      if @exam.save
        render json: @exam, status: 201
      else
        render json: @exam.errors,
               status: 500
      end
    end

  end
end
