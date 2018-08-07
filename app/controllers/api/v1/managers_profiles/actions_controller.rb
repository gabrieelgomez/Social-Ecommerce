module Api::V1::ManagersProfiles
  class ActionsController < ManagersProfilesController
    before_action :authenticate_v1_user!, except: :search_user
    before_action :set_profile, :set_user, only: :create_rol

    def create_rol
      return error_message_rol unless validate_roles
      return error_message_profile unless validate_user_profile

      @roles = @users.map{|user| user.add_role rol_params[:rol].to_sym, @profile}

      render json: @roles.uniq, status: 200

    end

    def search_user
      @user = User.find_by(email: params[:email])
      render json: @user, status: 200
    end

  end
end
