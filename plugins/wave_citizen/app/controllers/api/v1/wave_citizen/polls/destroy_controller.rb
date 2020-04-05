module Api::V1::WaveCitizen::Polls
  class DestroyController < PollsController
    before_action :set_poll, only: %i[destroy]

    def destroy
      if @poll.destroy
        render json: @poll, status: 200
      else
        render json: @poll.errors,
               status: 422
      end
    end

  end
end
