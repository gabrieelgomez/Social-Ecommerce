module Api::V1::SendedWishes
  class ActionController < SendedWishesController

    before_action :set_user
    before_action :set_wish
    before_action :set_profile

    def send_wish
      @sended_wish = SendedWish.new(sended_wish_params)
      if @sended_wish.save!
        render json: @sended_wish
      else
        render json: @sended_wish.errors
      end
    end
  end
end
