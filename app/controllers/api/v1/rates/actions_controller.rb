module Api::V1::Rates
  class ActionsController < RatesController
    before_action :authenticate_v1_user!
    before_action :set_score_validate, only: [:create]

    def create
      return update if @score_user
      @rate = Rate.new(rate_params)
      @rate.user = current_v1_user
      @rate.rateable = @rateable
      if @rate.save
        render json: @rate, status: 200
      else
        render json: @rate.errors, status: 500
      end
    end

    def update
      @score_user.update(score: rate_params[:score])
      if @score_user.save
        render json: @score_user, status: 200
      else
        render json: @score_user.errors,
               status: 500
      end
    end

    def destroy
      if @rate.destroy
        render json: @rate, status: 200
      else
        render json: @rate.errors,
               status: 500
      end
    end

  end
end
