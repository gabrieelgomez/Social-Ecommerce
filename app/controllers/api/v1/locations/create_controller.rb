module Api::V1::Locations
  class CreateController < LocationsController
    before_action :authenticate_v1_user!
    before_action :set_locatable

    def create
      @location = Location.new(location_params)
      if @location.save
        render json: @location, status: 200
      else
        render json: @location.errors, status: 500
      end
    end
  end
end
