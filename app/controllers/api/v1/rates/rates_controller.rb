module Api::V1
  class Rates::RatesController < ApiController
    include Concerns::ModelModulation
    private

    def rate_params
      params.require(:rate).permit(:score, :profile_id)
    end

    def set_score_validate
      @score_user = Rate.score_validate_user(current_v1_user, params[:profile_id])
    end

  end
end
