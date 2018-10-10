module Api::V1::Profiles
  class UpdateController < ProfilesController
    before_action :authenticate_v1_user!   , only: %i[change_type_profile]
    before_action :validate_password       , only: %i[change_type_profile]
    before_action :set_profile_current_user, only: %i[change_type_profile]

    def change_type_profile
      @updated_profile = @profile.change_type(params[:type_profile])
      if @updated_profile
        render json: @updated_profile, status: 200
      else
        render json: @updated_profile.errors, status: 200
      end
    end

    private

    def set_profile_current_user
      @profile = custom_find do
        current_v1_user.profiles.find(params[:profile_id])
      end
    end
  end
end
