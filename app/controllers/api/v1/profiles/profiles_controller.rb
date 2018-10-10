module Api::V1
  class Profiles::ProfilesController < ApiController
    include ::Api::V1::Concerns::ModelModulation
    before_action :set_profile, only: [:products_prominent]

    def all_profiles
      @result = Profile.all.uniq.as_json(only: [:id, :title, :photo, :created_at, :updated_at, :type_profile], methods: :category_ids)
      render json: @result, status: 200
    end

    def products_prominent
      @result = Profile.find(params[:profile_id]).products.select{|product| product.prominent == true }
      render json: @result, status: 200
    end

    private

    def set_profile
      @profile = custom_find {
        Profile.find(params[:profile_id])
      }
    end

    def validate_roles
      profile = Profile.find(params[:id]) rescue Profile
      permission = current_v1_user.has_role? [:admin, :editor], profile
      @profile = profile if permission
    end

  end
end
