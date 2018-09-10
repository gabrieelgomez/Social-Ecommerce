module Api::V1::Services
  class HomeController < ServicesController


    def home
      @result = build_json(params)
      render json: @result, status: 200
    end

    def build_json(params)
      @data = {
        data: {
          profiles_by_created_products: Home::HomeService.profiles(params),
          independents_by_created_at: Home::HomeService.independents(params),
          sellers_by_followers: Home::HomeService.sellers(params),
          categories_listing_by_products: Home::HomeService.categories,
          products_by_created_at: Home::HomeService.products_by_created_at(params),
          products_by_wishes: Home::HomeService.products_by_wishes(params),
          categories_by_profiles_nested_products: Home::HomeService.categories_by_profiles_nested_products
        }
      }
    end

  end
end