# Module Notifications Life
module Api::V1::Notifications
  # Class AdminController of Notifications Life
	class Admin::AdminController < NotificationsController
    before_action :set_notification, only: %i[destroy]

    def create
      if current_v1_user.email != 'bigwave.admin@gmail.com'
        render json: {errors: 'Access Denied'}, status: 200
      else
        @notification = Notification.create!(
          metadata: {title: params[:body]},
          image: params[:image],
          url: params[:url],
          category: 'admin',
          target: current_v1_user)

        render json: @notification, status: 200
      end
    end

    def show
      @notifications = Notification.where(category: 'admin_notification')
      render json: @notifications, status: 200
    end

    def destroy
      if @notification.destroy
        render json: @notification, status: 200
      else
        render json: @notification.errors,
               status: 500
      end
    end

    private

    def set_notification
      @notification = Notification.find(params[:notification_id])
    end

	end
end
