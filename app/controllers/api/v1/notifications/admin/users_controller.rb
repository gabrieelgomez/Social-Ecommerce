module Api::V1::Notifications::Admin
  class UsersController < AdminController


    def send_notifications
      @result = UserService.filter(params, current_v1_user)
      render json: @result, status: 200
    end

  end
end
