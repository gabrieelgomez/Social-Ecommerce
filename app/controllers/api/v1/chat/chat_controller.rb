module Api::V1
  class Chat::ChatController < ApiController
    before_action :authenticate_v1_user!
  end
end
