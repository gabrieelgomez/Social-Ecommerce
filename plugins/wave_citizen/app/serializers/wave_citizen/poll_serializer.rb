class WaveCitizen::PollSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Poll.column_names
  attributes :type_poll, :items, :poll_category, :citizen, :user

  def type_poll
    self.object.type_poll
  end

end
