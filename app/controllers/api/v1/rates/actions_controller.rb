module Api::V1::Rates
  class ActionsController < RatesController
    before_action :authenticate_v1_user!
    before_action :rate_params, only: [:create]
    before_action :set_score_validate, only: [:create]

    def create
      return update if @score_user
      @rate = Rate.new(rate_params)
      @rate.user = current_v1_user
      @rate.profile_id = params[:profile_id]
      if @rate.save
        render json: @rate
      else
        render json: @rate.errors
      end
    end

    def update
      @score_user.update(score: rate_params[:score])
      if @score_user.save
        render json: @score_user
      else
        render json: @score_user.errors
      end
    end

    def destroy
      if @rate.destroy
        render json: @rate, status: :done
      else
        render json: @rate.errors
      end
    end

  end
end
