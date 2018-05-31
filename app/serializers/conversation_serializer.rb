class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :senderable, :recipientable
end
