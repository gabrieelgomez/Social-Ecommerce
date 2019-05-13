class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    senderable = message.messageable
    recipientable = message.conversation.opposed_chater(senderable)

    broadcast_to_sender(senderable, message)
    broadcast_to_recipient(recipientable, message)
  end

  private

  def broadcast_to_sender(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      type: 'new_message',
      body: message.as_json(only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at])
    )
  end

  def broadcast_to_recipient(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      type: 'new_message',
      body: message.as_json(only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at])
    )
  end
end
