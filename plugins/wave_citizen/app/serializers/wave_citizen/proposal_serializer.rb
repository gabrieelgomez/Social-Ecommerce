class WaveCitizen::ProposalSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Proposal.column_names
  attributes :type_proposal, :proposal_category, :citizen, :user

  def type_proposal
    self.object.type_proposal
  end

end
