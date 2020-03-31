module Api::V1::WaveCitizen::Proposals
  class ShowController < ProposalsController
    before_action :set_proposal, only: [:show]

    def index
      render json: WaveCitizen::Proposal.all.order(id: :asc), status: 200
    end

    def show
      render json: @proposal, status: 200
    end

  end
end
