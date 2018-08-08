module Api::V1
  class Profiles::ProfilesController < ApiController
    include ::Api::V1::Concerns::ModelModulation

    def all_profiles
      @result = Profile.all
      render json: @result, status: 200
    end

  end
end
