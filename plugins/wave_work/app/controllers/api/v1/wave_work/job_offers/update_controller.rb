module Api::V1::WaveWork::Areas
  class UpdateController < AreasController
    before_action :set_area, only: %i[update]

    def update
      if @area.update(area_params)
        render json: @area, status: 200
      else
        render json: @area.errors,
               status: 500
      end
    end

  end
end
