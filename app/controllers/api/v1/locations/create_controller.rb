module Api::V1::Locations
  class CreateController < LocationsController
    before_action :authenticate_v1_user!
    before_action :set_locatable

    def create
      @location = Location.new(location_params)
      set_prominent_location
      if @location.save
        render json: @location, status: 200
      else
        render json: @location.errors, status: 422
      end
    end

    private

    def set_prominent_location
      @location.prominent = true if @locatable.locations.where(prominent: true).count.zero?
    end

  end
end
