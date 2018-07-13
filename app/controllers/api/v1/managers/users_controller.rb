module Api::V1
  module Managers
    class UsersController < ManagersController
      before_action :set_user, only: %i[censorship]


      def censorship
        if params[:censorship] == 'censor'
          @user.update(censured: true)
        elsif params[:censorship] == 'uncensor'
          @user.update(censured: false)
        end
        render json: @user, status: 200
      end

      def get_users
        @users = User.all
        render json: @users, status: 200
      end

      private

      def set_user
        @user = User.find_by(nickname: params[:nickname])
        return rescue_not_found('User') if @user.nil?
      end
    end
  end
end
