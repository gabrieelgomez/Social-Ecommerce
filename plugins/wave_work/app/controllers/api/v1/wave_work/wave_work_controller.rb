module Api::V1
  class WaveWork::WaveWorkController < ApiController
    before_action :authenticate_v1_user!

  end
end
