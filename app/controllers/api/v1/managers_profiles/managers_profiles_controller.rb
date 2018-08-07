module Api::V1
  class ManagersProfiles::ManagersProfilesController < ApiController

    private

    def set_user
      @users = User.find(rol_params[:user_ids]) rescue nil
    end

    def set_profile
      @profile = Profile.find(rol_params[:profile_id]) rescue nil
    end

    def rol_params
      params.require(:rol)
            .permit(:profile_id, :rol, user_ids:[])
    end

    def validate_roles
      case rol_params[:rol]
        when 'admin'
          true
        when 'editor'
          true
        when 'moderator'
          true
        else
          false
      end
    end

    def validate_user_profile
      @profile.user_id.eql?(current_v1_user.id)
    end

    def error_message_rol
      (render json: {error:'Rol not valid'}, status: 200)
    end

    def error_message_profile
      (render json: {error:'Profile not found'}, status: 200)
    end

  end
end
