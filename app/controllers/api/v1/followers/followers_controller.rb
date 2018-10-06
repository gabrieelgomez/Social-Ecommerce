module Api::V1
  class Followers::FollowersController < ApiController
    before_action :authenticate_v1_user!
    include Concerns::FollowingConvention
  end
end
