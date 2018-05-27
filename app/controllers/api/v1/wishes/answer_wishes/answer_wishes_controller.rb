module Api::V1::Wishes
  class AnswerWishes::AnswerWishesController < WishesController
    private

    def set_profile
      # byebug
      p_params = params[:answer_wish]
      @user = current_v1_user
      type = p_params[:type_profile].to_sym
      @profile = custom_find {
        @user.try(type).find p_params[:profile_id]
      }
      # byebug
    end

    def set_sended_wish
      @sended_wish = custom_find {
        @profile.sended_wishes.find params[:sended_wish_id]
      }
    end

    def answer_wish_params
      params.require(:answer_wish).permit(:message, :special_price, :limit_date,
                                          :claim_code, :special_conditions).merge(sended_wish: @sended_wish)
    end
  end
end
