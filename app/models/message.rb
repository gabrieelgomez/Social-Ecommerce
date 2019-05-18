class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :messageable, polymorphic: true
  after_create :create_notify_new_conversation
  # after_create :create_notify_new_cotization_message

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def create_notify_new_conversation
    return if messageable == conversation.senderable && conversation.messages.count == 1 && conversation.type_messages == 'cotization'
    sender = self.messageable
    # sender = sender.user if sender.is_a?(Profile)

    recipient = self.conversation.opposed_chater(sender)
    recipient = recipient.user if recipient.is_a?(Profile)

    Rails.logger.info(self)
    message   = "Tienes un nuevo mensaje de <strong>#{sender.name}</strong>"
    Notification.create_notify_models(recipient, sender, 'conversation', message)
  end

  def create_notify_new_cotization_message
    return if messageable == conversation.senderable || conversation.type_messages != 'cotization'
    recipient = conversation.senderable.user
    sender    = conversation.recipientable
    message   = "<strong>#{sender.name}</strong> ha respondido a su cotización"
    Notification.create_notify_models(recipient, sender, 'cotization', message)
  end

end
