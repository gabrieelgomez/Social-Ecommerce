module Api::V1::Services
  class HomeController < ServicesController


    def home
      Profile.current_user = current_v1_user
      Product.current_user = current_v1_user
      @result = build_json(params)
      render json: @result, status: 200
    end

    def build_json(params)
      states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)
      @data = {
        data: {
          profiles_by_created_products: Home::HomeService.profiles(params, states, countries),
          independents_by_created_at: Home::HomeService.independents(params, states, countries),
          sellers_by_followers: Home::HomeService.sellers(params, states, countries),
          categories_listing_by_products: Home::HomeService.categories,
          products_by_created_at: Home::HomeService.products_by_created_at(params, states, countries),
          products_by_wishes: Home::HomeService.products_by_wishes(params, states, countries),
          categories_by_profiles_nested_products: Home::HomeService.categories_by_profiles_nested_products
        }
      }
    end

  end
end
