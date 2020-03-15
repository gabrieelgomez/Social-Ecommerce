module Api::V1
  class Users::UsersController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_user, only: %i[update destroy]

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def user_params
      params.require(:user).permit(:name, :lastname, :banner, :nickname, :avatar, :email, :phone_one, :phone_two, :description, :dni, :birth_date, :age, :gender, :country, :password, :password_confirmation, roles_attributes: [:id, :name, :_destroy])
    end

  end
end
