module Api::V1::Notifications::Admin
  class UserService

    def self.filter(params)
      countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)
      states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      subcategories = params[:ages].try(:split, '-').try(:map, &:to_i)
      profiles      = params[:profiles]
      profiles      = params[:coins_wave].try(:split, '-')

      byebug
    end

  end
end
