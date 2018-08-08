module Api::V1::Searchs
  class ServicesProfilesController < SearchController

    def service_profile
      quantity      = params[:quantity].to_i || 10
      type_profiles = params[:type_profile].try(:split, '-') || []


      total    = Profile.count
      @result = Profile.offset(total-quantity)
      byebug

      # @result = profiles.ransack(type_profile_in: type_profiles).result

      render json: @result, status: 200
    end

  end
end
