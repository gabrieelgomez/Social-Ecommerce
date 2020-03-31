module Api::V1::WaveCitizen::Proposals
  class UpdateController < ProposalsController
    before_action :set_proposal, only: %i[update]

    def update
      if @proposal.update(proposal_params)
        render json: @proposal, status: 200
      else
        render json: @proposal.errors,
               status: 422
      end
    end

  end
end
