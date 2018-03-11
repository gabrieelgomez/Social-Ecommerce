module Api::V1::Profiles
  class CreateController < ProfileController

    # GET /v1/profile
    def new
      @profile = Profile.new
    end

    # POST /v1/profiles
    def create
      @profile = Profile.new(profile_params)

      if @profile.save
        render json: @profile, status: :created
      else
        render :new
      end
    end

    private

    def profile_params
      params.permit(:user_id, :type_profile, :title, :name)
    end

  end
end
