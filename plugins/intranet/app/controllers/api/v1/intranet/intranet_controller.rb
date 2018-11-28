module Api::V1
  class Intranet::IntranetController < ApiController
    before_action :authenticate_v1_user!
  end
end
