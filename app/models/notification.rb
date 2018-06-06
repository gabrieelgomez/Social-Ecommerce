class Notification < NotificationHandler::Notification

  def self.create_notify_models(recipient, sender, type, message)
    recipient.notify metadata: {
      title: message
    }
    # NotificationMailer.push(message, to: recipient.email).deliver_now
  end

end
