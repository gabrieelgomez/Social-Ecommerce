module Api::V1::Users
  class DestroyController < UsersController
    def destroy
      if @user.nil?
        render json: {errors: 'User not found.'}, status: 200
      elsif @user.destroy
        render json: @user, status: 200
      else
        render json: @user.errors, status: 422
      end
    end
  end
end
