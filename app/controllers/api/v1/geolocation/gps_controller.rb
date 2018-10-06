module Api::V1
  class Geolocation::GpsController < ApiController
    # before_action :authenticate_v1_user!
    def profiles_per_categories
      @profiles, @profiles_pr, @product_ids = GpsService.categ_search(params)
      #GpsService.locations(array de profiles, boolean si lleva o no products, y array products ids)
      @response_prof = GpsService.locations_response(@profiles, false, false)
      @response_prof_prod = GpsService.locations_response(@profiles_pr, true, @product_ids) unless params[:q].blank?
      @locations_response = @response_prof
      @locations_response += @response_prof_prod unless params[:q].blank?
      # render json: @locations_response, status: 200
      @result = Kaminari.paginate_array(@locations_response).page(params[:page]).per(params[:per_page])
      @total = @locations_response
      render json: {
            data: @result,
            meta: set_meta_pagination
        }, status: 200
    end

    private

    def set_meta_pagination
      PaginationService.build_meta(@result, @total, params[:per_page], request)
    end

  end
end
