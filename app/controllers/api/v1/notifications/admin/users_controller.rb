module Api::V1::Notifications::Admin
  class UsersController < AdminController


    def send_notifications
      # @result = UserService.filter(params)
      # session.delete(:notify_users)

      @notification = Notification.find(params[:notification_id])

      countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)
      states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      ages          = params[:ages].try(:split, '-').try(:map, &:to_i)
      profiles      = params[:profiles]
      coins_wave    = params[:coins_wave].try(:split, '-')

      case params[:type]
        when 'countries'
          @users = User.all.select{|user| user.search_in?(countries, :countries_codes)} if countries
        when 'states'
          @users = User.all.select{|user| user.search_in?(states, :states_codes)} if states
        when 'ages'
          @users = User.ransack(age_gteq: ages[0], age_lteq: ages[1]).result if ages
        when 'profiles'
          @users = User.select{|user| user.profiles.count.positive?} if profiles
        when 'coins'
          # @users = User.all.select{|user| user.search_in?(states, :states_codes)} if states
        else
          'Error'
      end

      @users.each do |user|
        recipient = user
        sender    = current_v1_user
        message   = @notification.metadata['title']
        #Method for create_notify, in order is recipient, sender, type, message
        Notification.create_notify_models(recipient, sender, 'admin', message)
      end

      render json: @users, status: 200
    end

  end
end
