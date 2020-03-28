module Api::V1::Wishes::SendedWishes
  class ActionController < SendedWishesController

    before_action :set_user
    before_action :set_wish
    before_action :set_profile

    def send_wish
      @sended_wish = SendedWish.new(
        user: @user,
        profile: @profile,
        wish: @wish
      )
      if @sended_wish.save
        render json: @sended_wish, status: 200
      else
        render json: @sended_wish.errors, status: 422
      end
    end
  end
end
