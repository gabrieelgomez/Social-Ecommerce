module Api::V1
  class WaveCitizen::WaveCitizenController < ApiController
    before_action :authenticate_v1_user!

  end
end
