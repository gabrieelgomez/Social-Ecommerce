module Api::V1
  class Searchs::SearchController < ApiController
    # before_action :build_json, only: :filters_search

    def global_search
      @array = Search::SearchService.deep_search(params)
      @total = @array
      @result = Kaminari.paginate_array(@array).page(params[:page]).per(params[:per_page])
      render json: {
            data: @result,
            meta: set_meta_pagination
        }, status: 200
    end

    def filters_search
      Product.current_user = current_v1_user
      @array = LookFor::GeneralService.search(params)
      @total = @array[0]
      build_json
      @result = Kaminari.paginate_array(@array[0]).page(params[:page]).per(params[:per_page])
      render json: {
            data: @result,
            filters_by_objects: @filters,
            meta: set_meta_pagination
        }, status: 200
    end

    def locations_response
      @result = LookFor::GeneralService.locations
      render json: {
        cities: @result.first,
        countries: @result.second
        }, status: 200
    end

    private

    def set_meta_pagination
      PaginationService.build_meta(@result, @total, params[:per_page], request)
    end

    def build_json
      @filters = {
        type_profiles_by_objects:   @array[1],
        categories_by_objects:      @array[2],
        countries_by_objects:       @array[3]
        }
    end

  end
end
