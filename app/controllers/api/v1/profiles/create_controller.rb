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
      @profile = current_v1_user.try(model_symbol)
                                .new(profile_params)
      @profile.category_ids = params[:profile][:category_ids]
      if @profile.save
        render json: @profile, status: 201
      else
        render json: @profile.errors,
               status: 500
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
