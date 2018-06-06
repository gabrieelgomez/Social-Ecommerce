class Notification < NotificationHandler::Notification

  def self.create_notify_models(recipient, sender, type, message)
    notification = recipient.notify type: type, metadata: {
      title: message
    }
    # NotificationMailer.push(message, to: recipient.email).deliver_now
  end

end
