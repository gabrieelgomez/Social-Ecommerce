module Api::V1::Wishes::AnswerWishes
  class CreateController < AnswerWishesController

    before_action :set_profile
    before_action :set_sended_wish

    def create
      @answer = @profile.answer_wishes.new(answer_wish_params)
      if @answer.save
        @wish = @sended_wish.wish
        @wish.update(response: true, sent: true)
        render json: @answer, status: 200
      else
        render json: @answer.errors, status: 500
      end
    end
  end
end
