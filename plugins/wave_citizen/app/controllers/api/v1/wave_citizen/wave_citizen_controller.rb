module Api::V1
  class WaveCitizen::WaveCitizenController < ApiController
    before_action :authenticate_v1_user!

    def set_current_user_support
      Current.user = current_v1_user
    end

  end
end
