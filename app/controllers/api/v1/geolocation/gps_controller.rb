module Api::V1
  class Geolocation::GpsController < ApiController
    # before_action :authenticate_v1_user!
    def profiles_per_categories
      @profiles, @profiles_pr, @product_ids = Gps.categ_search(params)
      #Gps.locations(array de profiles, boolean si lleva o no products, y array products ids)
      @response_prof = Gps.locations_response(@profiles, false, false)
      @response_prof_prod = Gps.locations_response(@profiles_pr, true, @product_ids)
      @locations_response = @response_prof + @response_prof_prod
      render json: @locations_response, status: 200
    end
  end
end
