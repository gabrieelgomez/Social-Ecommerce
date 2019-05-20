class Notification < NotificationHandler::Notification
  cattr_accessor :object_conversation
  mount_base64_uploader :image, ImageUploader

  # belongs_to :productable, polymorphic: true

  def self.create_notify_models(recipient, sender, type, message, conversation=nil, current_user=nil)
    type_category = nil
    settings = recipient.notification_setting.category_settings
    settings.each{|c| type_category = c if c[0].eql?(type)}

    if type_category.second['app']
      notification = recipient.notify category: type, metadata: {
        title: message
      }
    end

    if type_category.second['email']
      NotificationMailer.push(message, to: recipient.email).deliver_now
      # notification.push :CustomPusher, option_one: 'value_two'
    end

    # ActionCable.server.broadcast(
    #   "notifications-#{recipient.id}",
    #   data: notification.as_json(only: %i[id category metadata image read created_at], methods: %i[conversation] )
    # )

    if type == 'cotization' && conversation && current_user
      Notification.object_conversation = conversation
      Conversation.current_user = current_user
      ActionCable.server.broadcast(
        # "notifications-#{recipient.id}",
        # type: 'new_notification',
        # body: notification.as_json(only: %i[id category metadata image read created_at], methods: %i[conversation] )
        "notifications-#{recipient.id}",
         data: notification.as_json(only: %i[id category metadata image read created_at], methods: %i[conversation] )
      )
    else
      ActionCable.server.broadcast(
        # "notifications-#{recipient.id}",
        # type: 'new_notification',
        # body: notification.as_json(only: %i[id category metadata image read created_at])
        "notifications-#{recipient.id}",
         data: notification.as_json(only: %i[id category metadata image read created_at])
      )
    end

    notification
  end

  def conversation
    Rails.logger.info(Notification.object_conversation)
    Notification.object_conversation.as_json(
      only: [
        :id
      ], methods: [
        :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
      ],
        include: {
          cotization: {
            only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
            methods: [:details]
          }
        }
    )
  end

end
