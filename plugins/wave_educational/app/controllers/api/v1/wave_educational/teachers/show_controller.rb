module Api::V1::WaveEducational::Teachers
  class ShowController < TeachersController
    before_action :authenticate_v1_user!, only: [:teacher_cotizations]
    before_action :set_teacher, only: [:teacher_cotizations]
    # POST /v1/teachers

    before_action :set_teacher, only: %i[show]


    # Public methods
    def index
      render json: Pyme.all,
             fields: fields(:teachers),
             status: 200
    end

    def show
      render json: @teacher, status: 200
    end

    def own_teachers
      render json: current_v1_user.teachers, status: 200
    end

    private

    def set_teacher
      @teacher = custom_find do
        current_v1_user.teacher.find(params[:teacher_id])
      end
    end
  end
end
