module Api::V1::WaveCitizen::Polls
  class UpdateController < PollsController
    before_action :set_poll, only: %i[update]

    def update
      if @poll.update(poll_params)
        render json: @poll, status: 200
      else
        render json: @poll.errors,
               status: 422
      end
    end

  end
end
