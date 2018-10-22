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
      @result = profiles.uniq.as_json(only: %i[id title slug photo prominent created_at updated_at type_profile], methods: :category_ids)

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

    def profiles_by_cat_nested_products
      # Endpoint de profiles por productos asociados a una categoria
      # y ordenarlos de mayor a menor
      category = params[:category].to_i || 999999
      @result = Profile.all.select{|profile|
        profile.products.map{|product|
          product.category_ids.include?(category)
        }.include?(true)
      }

      render json: @result, status: 200
    end

  end
end
