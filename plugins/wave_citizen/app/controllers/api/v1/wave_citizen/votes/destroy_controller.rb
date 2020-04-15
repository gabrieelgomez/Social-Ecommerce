module Api::V1::WaveCitizen::Votes
  class DestroyController < VotesController
    before_action :set_vote, only: %i[destroy]

    def destroy
      if @vote.destroy
        render json: @vote, status: 200
      else
        render json: @vote.errors,
               status: 422
      end
    end

  end
end
