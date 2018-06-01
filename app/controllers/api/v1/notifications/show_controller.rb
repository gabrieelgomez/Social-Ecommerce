module Api::V1::Notifications
  class ShowController < NotificationsController

    def all
      render json: @notifications
    end

    def mark_notification
      case params[:mark]
        when 'read'
          @notification.update(read: true)
        when 'unread'
          @notification.update(read: false)
        else
          'Error'
      end
      render json: @notification
    end

  end
end
