module Api::V1
  class Profiles::ProfilesController < ApiController
    include ::Api::V1::Concerns::ModelModulation

    def all_profiles
      @result = Profile.all
      render json: @result, status: 200
    end

    private
    def set_profile
      @profile = custom_find {
        Profile.find(params[:profile_id])
      }
    end

    def validate_roles
      profile = Profile.find(params[:id]) rescue Profile
      permission = current_v1_user.has_role? [:admin, :editor], profile
      @profile = profile if permission
    end

  end
end
