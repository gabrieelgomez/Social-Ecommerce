module Api::V1::Wishes
  class ShowController < WishesController
    before_action :authenticate_v1_user!, except: [:wishes_by_user]

    def my_wishes
      @user = current_v1_user
      render json: @user.wishes, status: 200
    end

    def wishes_by_user
      @wishes =  User.where(id: params[:user_id]).first.wishes
      render json: @wishes, status: 200
    end

  end
end
