module Api::V1
  class Notifications::NotificationsController < ApiController
    before_action :authenticate_v1_user!
    before_action :all_notifications, only: [:all]
    before_action :set_notification, only: [:mark_notification]

    def notification_marking
      ids = params[:notifications_ids].try(:split, '-').try(:map, &:to_i)
      notifications = current_v1_user.notifications.where(id: ids)

      notifications.each do |notification|
        case params[:mark]
          when 'read'
          notification.update(read: true)
          when 'unread'
          notification.update(read: false)
          else
          nil
        end
      end
      render json: notifications.sort{|x| x.id}.as_json.reverse, status: 200
    end

    private

    def all_notifications
      @notifications = current_v1_user.notifications.sort{|x| x.id}.as_json.reverse
    end

    def set_notification
      @notification = custom_find {
        current_v1_user.notifications.find(params[:notification_id])
      }
    end

  end
end
