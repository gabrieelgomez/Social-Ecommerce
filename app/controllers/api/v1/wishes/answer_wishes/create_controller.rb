module Api::V1::Wishes::AnswerWishes
  class CreateController < AnswerWishesController

    before_action :set_profile
    before_action :set_sended_wish

    def create
      @answer = @profile.answer_wishes.new(answer_wish_params)
      if @answer.save
        render json: @answer
      else
        render json: @answer.errors
      end
    end
  end
end
