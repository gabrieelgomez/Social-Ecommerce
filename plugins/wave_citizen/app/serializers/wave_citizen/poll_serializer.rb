class WaveCitizen::PollSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Poll.column_names
  attributes :poll_category, :citizen, :user
end
