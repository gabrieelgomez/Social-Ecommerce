class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "notifications-#{current_user.id}"
  end

  def unreads
    Conversation.current_user = current_user
    ActionCable.server.broadcast(
      "notifications-#{current_user.id}",
      data: current_user.notifications.where(read: false).order(id: :asc).as_json(only: %i[id category metadata image read created_at], methods: %i[body] )
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
