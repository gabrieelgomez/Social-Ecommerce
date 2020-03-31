module Api::V1::WaveCitizen
  class Proposals::ProposalsController < WaveCitizenController

    private

    def set_proposal
      @proposal = WaveCitizen::Proposal.find_by(id: params[:proposal_id])
    end

    def proposal_params
      params.require(:proposal).permit(:title, :description, :user_id, :citizen_id, :proposal_category_id)
    end

  end
end
