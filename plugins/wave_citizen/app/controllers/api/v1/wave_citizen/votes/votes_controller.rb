module Api::V1::WaveCitizen
  class Votes::VotesController < WaveCitizenController

    private

    def set_vote
      @vote = WaveCitizen::Vote.find_by(id: params[:vote_id])
    end

    def vote_params
      params.require(:vote).permit(:votable_id, :votable_type, :user_id)
    end

  end
end
