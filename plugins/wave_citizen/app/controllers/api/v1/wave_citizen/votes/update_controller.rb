module Api::V1::WaveCitizen::Votes
  class UpdateController < VotesController
    before_action :set_vote, only: %i[update]

    def update
      if @vote.update(vote_params)
        render json: @vote, status: 200
      else
        render json: @vote.errors,
               status: 422
      end
    end

  end
end
