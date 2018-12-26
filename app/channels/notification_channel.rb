class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "notifications-#{current_user.id}"
  end

  def unreads
    ActionCable.server.broadcast(
      "notifications-#{current_user.id}",
      # data: current_user.notifications.where(read: false).sort{|x| x.id}.as_json.reverse
      data: current_user.notifications.where(read: false).order(id: :asc)
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
