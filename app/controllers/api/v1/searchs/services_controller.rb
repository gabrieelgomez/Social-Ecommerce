module Api::V1::Searchs
  class ServicesController < SearchController
    before_action :authenticate_v1_user!, only: [:suggest_query]

    def filters_by_cat
      # Params
      category = params[:category].to_i
      quantity      = params[:quantity] || 99999999
      states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)
      type_profiles = params[:type_profile].try(:split, '-').try(:map, &:capitalize) || []

      # Search service
      category = Category.find(category) rescue nil

      products = Category.search_by_products(category, products, states, countries)

      profiles = Category.search_by_profiles(category, profiles, type_profiles, states, countries)

      if params[:type_search].eql?('products')
        @result = products.take(quantity.to_i)
      elsif params[:type_search].eql?('profiles')
        @result = profiles.take(quantity.to_i)
      elsif params[:type_search].empty?
        @result = products.take(quantity.to_i) + profiles.take(quantity.to_i)
      end

      render json: @result, status: 200
    end

    def suggest_query
      categories_products = current_v1_user.map_suggest('Product')
      categories_profiles = current_v1_user.map_suggest('Profile')

      return nil if categories_products.nil? or categories_profiles.nil?
      @shuffle = Category.suggest_query(categories_products, quantity, 'products')

      if @shuffle.nil?
        @shuffle = Category.suggest_query(categories_profiles, quantity, 'profiles')
      end

      render json: @shuffle, status: 200
    end

  end
end
