module Api::V1
  class Statistics::StatisticsController < ApiController
    before_action :authenticate_v1_user!

  end
end
