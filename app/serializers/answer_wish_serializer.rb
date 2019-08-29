class AnswerWishSerializer < ActiveModel::Serializer
  attributes :id, :profile, :sended_wish, :message, :special_price, :limit_date,
  :claim_code, :special_conditions, :created_at, :updated_at, :conversation

  def conversation
    Conversation.current_user = @instance_options[:current_user]
    conversation = object.conversation.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
        ]
      )
  end

end
