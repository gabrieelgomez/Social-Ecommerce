module Api::V1
  class Searchs::SearchController < ApiController

    def global_search
      @result = Search.deep_search(params)
      render json: @result, status: 200
    end

    def filters_search
      @result = LookFor.search(params)
      render json: {
          products: @result.first,
          profiles: @result.second,
          filters: @result.third
        }, status: 200
    end

    def locations_response
      @result = LookFor.locations
      render json: {
        cities: @result.first,
        countries: @result.second
        }, status: 200
    end

  end
end
