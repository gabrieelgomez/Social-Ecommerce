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
      @profile.user_id.eql?(current_v1_user.id) or
      current_v1_user.has_role? :admin, @profile
    end

    def error_message_rol
      (render json: {error:'Rol not valid'}, status: 200)
    end

    def error_message_profile
      (render json: {error:'Access denied to assign role'}, status: 200)
    end

    def search_profile(object)
      Profile.find(object.resource_id).as_json(only: [:id, :title, :type_profile])
    end

    def search_profile_roles
      Role.find_by(resource_id: params[:profile]).users.map{|user|
        [role: user.roles.find_by(resource_id: params[:profile]).name,
         user: user.name,
         email: user.email,
         nickname: user.nickname,
         avatar: user.avatar]
      }.flatten
    end

  end
end
