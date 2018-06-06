NotificationPusher.configure do |config|

  config.define_pusher :ActionMailer
    # A pusher handles the process of sending your notifications to various services for you.
    # Learn more: https://github.com/jonhue/notifications-rails/tree/master/notification-pusher#pushers
    # config.define_pusher :ActionMailer, email: 'my@email.com'

end
