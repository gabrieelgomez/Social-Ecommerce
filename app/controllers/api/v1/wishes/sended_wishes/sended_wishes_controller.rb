module Api::V1::Wishes
  class SendedWishes::SendedWishesController < WishesController
    before_action :authenticate_v1_user!

    private

    def set_user
      @user = current_v1_user
    end

    def set_wish
      @wish = custom_find { @user.wishes.find params[:wish_id] }
    end

    def set_profile
      @profile = Profile.find params[:profile_id]
    end

    def sended_wish_params
      params.require(:sended_wish).permit(:profile_id, :wish_id,
                                          :user_id)
    end
  end
end
