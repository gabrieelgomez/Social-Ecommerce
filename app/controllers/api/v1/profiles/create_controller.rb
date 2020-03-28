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
        render json: [errors: 'Location must exist minimum one'], status: 200
      elsif @profile.save
        Location.create(
          latitude: latitude,
          longitude: longitude,
          title: title_location,
          prominent: true,
          locatable: @profile
        )
        render json: @profile, status: 200
      else
        render json: @profile.errors,
               status: 422
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:title, :slug, :email, :banner, :photo,
                                      :launched, :phone, :address, :vision,
                                      :mission, :description, :web, :experience,
                                      category_ids: [])
    end
  end
end
