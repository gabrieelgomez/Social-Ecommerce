class WaveCitizen::ProposalSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Proposal.column_names
  attributes :proposal_category, :citizen, :user
end
