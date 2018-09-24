module Api::V1
  class Rates::RatesController < ApiController
    include Concerns::ModelModulation
    before_action :set_rateable

    def set_raiting_user_profile
      # Root
      @rates = []
      @rateable.rates.map{ |rate|
        @rates.push(
          rate_id: rate.id,
          type: rate.rateable_type,
          score: rate.score,
          user: rate.user.email,
          comments: rate.root_comments
        )
      }
      render json: @rates, status: 200
    end

    private

    def set_rateable
      @rateable = custom_find { params[:rateable_type].modelarize.find params[:rateable_id]
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
