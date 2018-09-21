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
      message: message,
      conversation_id: message.conversation_id
    )
  end
 
  def broadcast_to_recipient(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      message: message,
      conversation_id: message.conversation_id
    )
  end
end
