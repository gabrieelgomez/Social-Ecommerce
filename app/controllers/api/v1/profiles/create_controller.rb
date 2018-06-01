module Api::V1::Profiles
  class CreateController < ProfilesController
    before_action :authenticate_v1_user!, only: [:create]
    # before_action :type_profile, only: [:create]
    # POST /v1/profiles

    def new
      @profile = Profile.new
      @countries = CS.countries
      render json: {
        countries: @countries
      }
    end

    def create
      @profile = model_name.new(profile_params)
      # @profile.type_profile = type_profile
      @profile.category_ids = params[:profile][:category_ids]
      @profile.user = current_v1_user
      if @profile.save
        render json: @profile
      else
        render json: ErrorSerializer.serialize(@profile.errors)
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:user_id, :title, :name, :type_profile,
                                      :email, :banner, :photo, :launched, :phone,
                                      :url, :address, :vision, :mission, :description,
                                      :web, :profile, :experience, :country)
    end
  end
end
