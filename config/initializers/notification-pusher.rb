NotificationPusher.configure do |config|

  config.define_pusher :ActionMailer, from: 'bigwave.ve@gmail.com'
  # config.define_pusher :CustomPusher, option_one: 'value_one'
    # A pusher handles the process of sending your notifications to various services for you.
    # Learn more: https://github.com/jonhue/notifications-rails/tree/master/notification-pusher#pushers
    # config.define_pusher :ActionMailer, email: 'my@email.com'

end
