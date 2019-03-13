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
      @profile.user = current_v1_user

      latitude  = params[:profile][:locations][:latitude]
      longitude = params[:profile][:locations][:longitude]
      title_location = params[:profile][:locations][:title]

      if latitude.nil? || longitude.nil?
        render json: [errors: 'Location must exist minimum one'], status: 201
      elsif @profile.save
        Location.create(
          latitude: latitude,
          longitude: longitude,
          title: title_location,
          prominent: true,
          locatable: @profile
        )
        render json: @profile, status: 201
      else
        render json: @profile.errors,
               status: 500
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:user_id, :title, :slug, :type_profile,
                                      :email, :banner, :photo, :launched, :phone,
                                      :url, :address, :vision, :mission, :description,
                                      :web, :profile, :experience, :country, :validation,
                                      category_ids: [])
    end
  end
end
