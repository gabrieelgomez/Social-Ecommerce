module Api::V1
  class Searchs::SearchController < ApiController

    def global_search
      @result = Search.deep_search(params)
      render json: @result, status: 200
    end

    def filters_search
      @result = LookFor.search(params)
      render json: {
          products: @result[0],
          profiles: @result[1],
          filters_by_products: {
            type_profiles_by_products:   @result[2],
            categories_by_products:      @result[3]
          },

          filters_by_profiles: {
            type_profiles_by_profiles:   @result[4],
            categories_by_profiles:      @result[5]
          }

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
