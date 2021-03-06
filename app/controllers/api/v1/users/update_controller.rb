module Api::V1::Users
  class UpdateController < UsersController
    def update
      if @user.update(user_params)
        render json: @user, status: 200
      else
        render json: @user.errors, status: 422
      end
    end
  end
end
