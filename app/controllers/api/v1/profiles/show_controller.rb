module Api::V1::Profiles
  class ShowController < ProfilesController
    before_action :authenticate_v1_user!, only: [:profile_cotizations]
    before_action :set_profile, only: [:profile_cotizations]
    # POST /v1/profiles

    def profile_cotizations
      
      @cotizations = @profile.cotizations
      render json: @cotizations,
             include: params[:include],
             fields: fields(:cotization),
             status: 200
    end

    private

    def set_profile
      @profile = custom_find do
        current_v1_user.profiles.find(params[:profile_id])
      end
    end
  end
end
