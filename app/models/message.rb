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
    message   = "Tienes un nuevo mensaje de #{sender.name}"
    Notification.create_notify_models(recipient, sender, 'conversation', message)
  end

  def create_notify_new_cotization_message
    return if messageable == conversation.senderable || conversation.type_messages != 'cotization'
    recipient = conversation.senderable.user
    sender    = conversation.recipientable
    message   = "#{sender.name} ha respondido a su cotización"
    Notification.create_notify_models(recipient, sender, 'cotization', message)
  end

end
