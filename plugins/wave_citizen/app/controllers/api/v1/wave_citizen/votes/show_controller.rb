module Api::V1::WaveCitizen::Votes
  class ShowController < VotesController
    before_action :set_vote, only: [:show]

    def index
      @votes =  WaveCitizen::Vote.all.order(id: :desc)
      render json: @votes, status: 200
    end

    def show
      render json: @vote, status: 200
    end

  end
end
