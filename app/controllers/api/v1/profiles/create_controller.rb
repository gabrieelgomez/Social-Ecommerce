module Api::V1::Profiles
  class CreateController < ProfilesController
    before_action :authenticate_v1_user!, only: [:create]
    before_action :type_profile, only: [:create]
    # POST /v1/profiles
    def create
      @profile = Profile.new(profile_params)
      @profile.type_profile = type_profile
      if @profile.save
        render json: @profile
      else
        render json: ErrorSerializer.serialize(@profile.errors)
      end
    end

    private

    def type_profile
      params[:type_profile].singularize
    end

    def profile_params
      params.require(:profile).permit(:user_id, :title, :name, :type_profile,
                                      :email, :banner, :photo, :launched, :phone,
                                      :url, :address, :vision, :mission, :description,
                                      :web, :profile, :experience)
    end
  end
end
