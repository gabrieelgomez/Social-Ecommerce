module Api::V1::SendedWishes
  class ActionController < SendedWishesController

    before_action :set_user
    before_action :set_wish
    before_action :set_profile

    def send_wish
      byebug
      @sended_wish = SendedWish.new(sended_wish_params)
    end
  end
end
