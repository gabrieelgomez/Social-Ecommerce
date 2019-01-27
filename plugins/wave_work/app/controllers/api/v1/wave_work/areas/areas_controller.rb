module Api::V1::WaveWork
  class Areas::AreasController < WaveWorkController
    before_action :verify_superadmin_rol, only: %i[create destroy update]

    private

    def set_area
      @area = WaveWork::Area.find(params[:area_id])
    end

    def area_params
      params.require(:area).permit(:title, subareas:[])
    end

  end
end
