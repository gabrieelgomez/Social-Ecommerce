module Api::V1::WaveWork::Areas
  class CreateController < AreasController

    def create
      @area = WaveWork::Area.new(area_params)
      if @area.save
        render json: @area, status: 201
      else
        render json: @area.errors,
               status: 500
      end
    end

  end
end
