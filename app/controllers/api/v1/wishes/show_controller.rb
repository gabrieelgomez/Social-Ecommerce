module Api::V1::Wishes
  class ShowController < WishesController

    def my_wishes
      @user = current_v1_user
      render json: @user.wishes
    end
  end
end