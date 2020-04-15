module Api::V1::WaveCitizen::Proposals
  class CreateController < ProposalsController

    def create
      @proposal = WaveCitizen::Proposal.new(proposal_params)
      @poll.user = current_v1_user
      if @proposal.save
        render json: @proposal, status: 200
      else
        render json: @proposal.errors,
               status: 422
      end
    end

  end
end
