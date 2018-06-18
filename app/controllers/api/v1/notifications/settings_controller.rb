module Api::V1::Notifications
  class SettingsController < NotificationsController

    def show
      @settings = custom_find {
        current_v1_user.notification_setting
      }
      render json: @settings
    end

    def update
      @new = JSON.parse(params[:category_settings].to_json)
      @settings = custom_find {
        current_v1_user.notification_setting.update(category_settings: @new)
      }
      render json: @new
    end

  end
end
