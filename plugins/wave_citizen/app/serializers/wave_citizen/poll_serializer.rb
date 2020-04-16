class WaveCitizen::PollSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Poll.column_names
  attributes :type_poll, :voted_by_current_user, :total_poll_votes, :items, :poll_category, :citizen, :user

  def type_poll
    self.object.type_poll
  end

  def voted_by_current_user
    self.object.voted_by_current_user
  end

  def total_poll_votes
    self.object.total_poll_votes
  end

  def items
    self.object.items.as_json(only: %i[id title description poll_id created_at updated_at], methods: %i[total_item_votes voted_by_current_user])
  end
end
