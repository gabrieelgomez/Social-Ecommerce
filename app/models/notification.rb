class Notification < NotificationHandler::Notification
  cattr_accessor :object
  mount_base64_uploader :image, ImageUploader

  # belongs_to :productable, polymorphic: true

  def self.create_notify_models(recipient, sender, type, message, object=nil, current_user=nil)
    type_category = nil
    settings = recipient.notification_setting.category_settings
    settings.each{|c| type_category = c if c[0].eql?(type)}
    if type_category.second['app']
      notification = recipient.notify category: type, object_id: object.id, object_type: object.class.to_s, current_user_id: current_user.id, current_user_type: current_user.class.to_s, metadata: {
        title: message
      }
    end

    if type_category.second['email']
      NotificationMailer.push(message, to: recipient.email).deliver_now
      # notification.push :CustomPusher, option_one: 'value_two'
    end

    Notification.object = object
    Conversation.current_user = current_user
    ActionCable.server.broadcast(
      "notifications-#{recipient.id}",
       data: notification.as_json(only: %i[id category metadata image read created_at], methods: %i[body] )
    )

    notification
  end

  def body
    Rails.logger.info(Notification.object)
    Conversation.current_user = self.current_user
    case self.category
      when 'cotization'
        self.object.as_json(
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
      when 'conversation'
        self.object.as_json(
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
      else
        self.object
    end # End case
  end

  def object
    self.object_type.constantize.where(id: self.object_id).first
  end

  def current_user
    self.current_user_type.constantize.where(id: self.current_user_id).first
  end

end
