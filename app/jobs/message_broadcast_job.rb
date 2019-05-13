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

  def broadcast_to_sender(senderable, message)
    ActionCable.server.broadcast(
      "conversations-#{senderable.is_a?(User) ? senderable.id : senderable.user.id}",
      type: 'new_message',
      body: message.as_json(only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at])
    )
  end

  def broadcast_to_recipient(recipientable, message)
    ActionCable.server.broadcast(
      "conversations-#{recipientable.is_a?(User) ? recipientable.id : recipientable.user.id}",
      type: 'new_message',
      body: message.as_json(only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at])
    )
  end
end
