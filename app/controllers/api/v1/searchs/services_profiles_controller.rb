module Api::V1::Searchs
  class ServicesProfilesController < ServicesController

    # Services Profile: Ultimos profiles, cantidad y por tipo de profile
    def service_profile(objects = nil)
      quantity      = params[:quantity].to_i || 10
      case objects
        when nil
          ids = Profile.last(quantity).map(&:id)
        else
          ids = objects.map(&:id)
      end

      # Params
      type_profiles = params[:type_profile].try(:split, '-').try(:map, &:capitalize) || []
      prominent     = params[:prominent] || nil
      # Falta que se filtren por categoria

      # Search Service
      profiles = Profile.where(id:ids)
                        .ransack(type_profile_in: type_profiles).result
                        .ransack(prominent_eq: prominent).result


      # Result
      @result = profiles.uniq.as_json(only: [:id, :title, :photo, :prominent, :created_at, :updated_at, :type_profile], methods: :category_ids)

      render json: @result, status: 200
    end

    # Services Profile by Products: todos los profiles por una cantidad de productos activos
    def service_by_products_status
      # Params
      status      = params[:prominent] || nil
      type_profiles = params[:type_profile].try(:split, '-').try(:map, &:capitalize) || []
      # Search Service
      profiles = Profile.select{|profile| profile.products.where(status: true).count >= 2 }
      service_profile(profiles)
    end

  end
end
