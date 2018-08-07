module Api::V1
  class Rates::RatesController < ApiController
    include Concerns::ModelModulation

    private

    def set_rateable
      @rateable = custom_find { 
        params[:rateable_type].modelarize.find params[:rateable_id]
      }
    end

    def rate_params
      params.require(:rate).permit(:score, :rateable_id, :rateable_type)
    end

    def set_score_validate
      @score_user = Rate.score_validate_user(current_v1_user, @rateable)
    end

  end
end
