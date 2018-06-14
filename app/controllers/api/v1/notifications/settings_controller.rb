module Api::V1::Notifications
  class SettingsController < NotificationsController

    def show
      @settings = custom_find {
        current_v1_user.notification_setting
      }
      render json: @settings
    end

    def update
      @new = params[:category_settings].to_json
      @settings = custom_find {
        current_v1_user.notification_setting.category_settings = @new
      }
      render json: @settings
    end

  end
end
