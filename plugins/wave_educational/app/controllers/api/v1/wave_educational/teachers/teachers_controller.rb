module Api::V1::WaveEducational
  class Teachers::TeachersController < WaveEducationalController

    private

    def set_teacher
      @teacher = WaveEducational::Teacher.find(params[:teacher_id])
    end

    def teacher_params
      params.require(:teacher).permit(:user_id, :slug, :name, :type_teacher,
                                      :email, :banner, :photo, :launched, :phone,
                                      :url, :address, :vision, :mission, :description,
                                      :web, :teacher, :experience, :country, :validation)
    end

  end
end
