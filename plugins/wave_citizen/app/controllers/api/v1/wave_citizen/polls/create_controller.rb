module Api::V1::WaveCitizen::Polls
  class CreateController < PollsController

    def create
      @poll = WaveCitizen::Poll.new(poll_params)
      @poll.user = current_v1_user
      if @poll.save
        render json: @poll, status: 200
      else
        render json: @poll.errors,
               status: 422
      end
    end

  end
end
