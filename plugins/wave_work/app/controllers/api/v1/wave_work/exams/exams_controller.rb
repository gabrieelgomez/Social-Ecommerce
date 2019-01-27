module Api::V1::WaveWork
  class Exams::ExamsController < WaveWorkController

    private

    def model_name
      type = params[:examenable_type]
      "WaveWork::".concat(type.camelize).singularize.camelize.constantize
    end

    def set_examenable
      @examenable = model_name.find(params[:examenable_id])
    end

    def set_exam
      @exam = WaveWork::Exam.find(params[:exam_id])
    end

    def exam_params
      params.require(:exam).permit(:title, :description)
    end

  end
end
