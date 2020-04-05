module Api::V1::WaveCitizen::Polls
  class ShowController < PollsController
    before_action :set_poll, only: [:show]

    def index
      render json: WaveCitizen::Poll.all.order(id: :asc), status: 200
    end

    def show
      render json: @poll, status: 200
    end

  end
end
