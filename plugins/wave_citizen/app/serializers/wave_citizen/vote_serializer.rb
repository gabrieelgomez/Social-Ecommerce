class WaveCitizen::VoteSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Vote.column_names
  attributes :votable, :poll, :citizen, :user

  def citizen
    self.object.citizen
  end

end
