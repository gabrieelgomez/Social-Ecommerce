# frozen_string_literal: true

class WaveCitizen::PollSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Poll.column_names
  attributes :type_poll, :voted_by_current_user, :total_poll_votes, :items,
             :poll_category, :citizen, :user, :total_comments, :comments,
             :total_likes, :likes, :liked_by_current_user

  def items
    object.items.as_json(only: %i[id title description poll_id
                                  created_at updated_at],
                         methods: %i[total_item_votes
                                     voted_by_current_user])
  end
end
