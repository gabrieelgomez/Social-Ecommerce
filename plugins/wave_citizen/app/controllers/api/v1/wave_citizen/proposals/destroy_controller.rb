module Api::V1::WaveCitizen::Proposals
  class DestroyController < ProposalsController
    before_action :set_proposal, only: %i[destroy]

    def destroy
      if @proposal.destroy
        render json: @proposal, status: 200
      else
        render json: @proposal.errors,
               status: 422
      end
    end

  end
end
