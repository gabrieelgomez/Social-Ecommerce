module Api::V1
  class WaveEducational::WaveEducationalController < ApiController
    before_action :authenticate_v1_user!

  end
end
