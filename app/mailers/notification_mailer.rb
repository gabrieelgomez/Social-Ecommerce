class NotificationMailer < ApplicationMailer
  default from: 'bigwave.ve@gmail.com'
  # layout 'push'

    def push(message, options = {})
      # render(layout: options[:layout]) if options.has_key?(:layout)
      @notification = message
      @renderer = options[:renderer] || 'actionmailer'
      mail(
        from: 'bigwave.ve@gmail.com',
        to: options[:to],
        subject: 'Notificación - Bigwave',
        # template_path: 'app/views/notification_mailer/push'
        # template_name: 'push'
      )
    end

end
