class Notification < NotificationHandler::Notification

  def self.create_notify_models(recipient, sender, type, message)
    type_category = nil
    settings = recipient.notification_setting.category_settings
    settings.each{|c| type_category = c if c[0].eql?(type)}

    if type_category.second['app']
      # recipient.notify category: type, metadata: {
      #   title: message
      # }
    end

    if type_category.second['email']
      # NotificationMailer.push(message, to: recipient.email).deliver_now
      # notification.push :CustomPusher, option_one: 'value_two'
    end

  end

end
