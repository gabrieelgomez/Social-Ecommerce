module Api::V1
  class Searchs::SearchController < ApiController

    def global_search
      @result = Search.deep_search(params)
      render json: @result
    end
  end
end
