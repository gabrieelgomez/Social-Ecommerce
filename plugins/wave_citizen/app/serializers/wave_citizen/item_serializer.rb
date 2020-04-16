class WaveCitizen::ItemSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Item.column_names
  attributes :total_item_votes, :voted_by_current_user, :poll

  def total_item_votes
    self.object.total_item_votes
  end

  def voted_by_current_user
    self.object.voted_by_current_user
  end

end
