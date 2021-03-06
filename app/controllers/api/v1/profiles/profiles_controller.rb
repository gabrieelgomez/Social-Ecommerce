module Api::V1
  class Profiles::ProfilesController < ApiController
    include ::Api::V1::Concerns::ModelModulation
    before_action :set_profile, only: [:products_prominent]
    before_action :authenticate_v1_user!, except: [:most_recent]

    def all_profiles
      @result = Profile.all.uniq.as_json(only: [:id, :title, :slug, :photo, :created_at, :updated_at, :type_profile], methods: :category_ids)
      render json: @result, status: 200
    end

    def products_prominent
      @result = Profile.find(params[:profile_id]).products.select{|product| product.prominent == true }
      render json: @result, status: 200
    end

    def own_profile
      @profile = current_v1_user.profiles.where(id: params[:profile_id]).first
      @profile.nil? ? @result = false : @result = true
      render json: @result, status: 200
    end

    def most_used_by_current_user
      @profiles = current_v1_user.profiles.order(updated_at: :desc).take(5).uniq.as_json(only: %i[id title slug photo created_at updated_at type_profile countries_codes states_codes], methods: :category_ids)
      render json: {data: @profiles}, own: true, status: 200
    end

    def most_recent
      @profiles = Profile.order(created_at: :desc).uniq.as_json(only: %i[id title slug photo created_at updated_at type_profile countries_codes states_codes], methods: :category_ids)
      render json: {data: @profiles}, own: true, status: 200
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
