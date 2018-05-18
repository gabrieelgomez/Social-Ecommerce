module Api::V1
  class Geolocation::GpsController < ApiController
    # before_action :authenticate_v1_user!
    def profiles_per_categories
      @profiles = Gps.categ_search(params)
      @locations_response = Gps.locations_response(@profiles)
      render json: @locations_response
    end
  end
end
