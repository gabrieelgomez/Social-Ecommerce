module Api::V1
  class SendedWishes::SendedWishesController < ApiController
    before_action :authenticate_v1_user!
  end
end
