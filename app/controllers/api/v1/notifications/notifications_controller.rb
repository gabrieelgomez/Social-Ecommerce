module Api::V1
  class Notifications::NotificationsController < ApiController
    before_action :authenticate_v1_user!
    before_action :all_notifications, only: [:all]
    before_action :set_notification, only: [:mark_notification]

    private

    def all_notifications
      @notifications = current_v1_user.notifications
    end

    def set_notification
      @notification = custom_find {
        current_v1_user.notifications.find(params[:notification_id])
      }
    end

  end
end
