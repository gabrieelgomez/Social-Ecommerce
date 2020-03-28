module Api::V1::Locations
  class UpdateController < LocationsController
    before_action :authenticate_v1_user!
    before_action :set_locatable
    before_action :set_location

    def update
      if @location.update(location_params)
        render json: @location, status: 200
      else
        render json: @location.errors, status: 422
      end
    end
  end
end
