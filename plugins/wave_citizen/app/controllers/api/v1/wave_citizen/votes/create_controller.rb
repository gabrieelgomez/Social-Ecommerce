module Api::V1::WaveCitizen::Votes
  class CreateController < VotesController

    def create
      @vote = WaveCitizen::Vote.new(vote_params)
      @vote.user = current_v1_user
      @vote.poll = @vote.votable.poll if @vote.votable.is_a?(WaveCitizen::Item)
      @vote.vote = true
      if @vote.save
        render json: @vote, status: 200
      else
        render json: @vote.errors,
               status: 422
      end
    end

  end
end
