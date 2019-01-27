module Api::V1::WaveWork::Areas
  class DestroyController < AreasController
    before_action :set_area, only: %i[destroy]

    def destroy
      if @area.destroy
        render json: @area, status: 200
      else
        render json: @area.errors,
               status: 500
      end
    end

  end
end
