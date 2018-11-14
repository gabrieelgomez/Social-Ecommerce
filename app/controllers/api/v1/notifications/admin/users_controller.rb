module Api::V1::Notifications::Admin
  class UsersController < AdminController

    def filter_users
      @result = UserService.filter(params)
      render json: @result, status: 200
    end

  end
end
