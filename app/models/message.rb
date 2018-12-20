class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :messageable, polymorphic: true
  after_create :create_notify_new_conversation
  after_create :create_notify_new_cotization_message

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def create_notify_new_conversation
    return unless messageable == conversation.senderable && conversation.messages.count == 1 && conversation.type_messages != 'cotization'
    recipient = conversation.recipientable.user
    sender    = conversation.senderable
    message   = "Tienes un nuevo mensaje de *#{sender.name}*"
    notification = Notification.create_notify_models(recipient, sender, 'conversation', message)

    # ActionCable.server.broadcast(
    #   "notifications-#{recipient.id}",
    #   message: message,
    #   notification_id: notification.id
    # )
    ActionCable.server.broadcast(
      "notifications-#{recipient.id}",
      data: notification
    )
  end

  def create_notify_new_cotization_message
    return if messageable == conversation.senderable || conversation.type_messages != 'cotization'
    recipient = conversation.senderable.user
    sender    = conversation.recipientable
    message   = "*#{sender.name}* ha respondido a su cotización"
    notification = Notification.create_notify_models(recipient, sender, 'cotization', message)

    # ActionCable.server.broadcast(
    #   "notifications-#{recipient.id}",
    #   message: message,
    #   notification_id: notification.id
    # )
    ActionCable.server.broadcast(
      "notifications-#{recipient.id}",
      data: notification
    )
  end

end
