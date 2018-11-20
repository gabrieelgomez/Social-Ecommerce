module Api::V1::Notifications::Admin
  class UserService

    def self.filter(params)
      # byebug
      # session.delete(:notifications_users)

      # countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)
      # states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      # ages          = params[:ages].try(:split, '-').try(:map, &:to_i)
      # profiles      = params[:profiles]
      # coins_wave    = params[:coins_wave].try(:split, '-')
      #
      # case params[:type]
      #   when 'countries'
      #     users = User.all.select{|user| user.search_in?(countries, :countries_codes)} if countries
      #   when 'states'
      #     users = User.all.select{|user| user.search_in?(states, :states_codes)} if states
      #   when 'ages'
      #   when 'profiles'
      #   when 'coins'
      #   else
      #     'Error'
      # end

    end

  end
end
