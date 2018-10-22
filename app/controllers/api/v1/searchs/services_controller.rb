module Api::V1::Searchs
  class ServicesController < SearchController
    before_action :authenticate_v1_user!, only: [:suggest_query]

    def filters_by_cat
      # Params
      category = params[:category].to_i
      quantity      = params[:quantity] || 99999999

      # Search service
      category = Category.find(category) rescue nil

      products = category.products
                         .uniq
                         .as_json(only: %i[id type_profile name price cover], methods: %i[category_ids subcategory_ids links])

      profiles = category.by_profiles
                         .uniq
                         .as_json(only: %i[id title slug photo name type_profile], methods: %i[category_ids])

      if params[:type_search].eql?('products')
        @result = products.take(quantity.to_i)
      elsif params[:type_search].eql?('profiles')
        @result = profiles.take(quantity.to_i)
      elsif params[:type_search].nil?
        @result = products.take(quantity.to_i) + profiles.take(quantity.to_i)
      end

      render json: @result, status: 200
    end

    def suggest_query
      categories_products = current_v1_user.map_suggest('Product')
      categories_profiles = current_v1_user.map_suggest('Profile')

      return nil if categories_products.nil? or categories_profiles.nil?
      @shuffle = Category.find(categories_products).map{|category| category.products.sample(5)}
                         .flatten
                         .uniq
                         .as_json(only: %i[id type_profile name price cover], methods: %i[category_ids subcategory_ids links])

      if @shuffle.nil?
        # @shuffle = Category.find(categories_profiles).map{|category|
        #   category.pymes.sample(2) + category.sellers.sample(2) + category.independents.sample(2)}
        @shuffle = Category.find(categories_profiles).map{|category| category.by_profiles.sample(2)}
                           .flatten
                           .uniq
                           .as_json(only: %i[id title photo name type_profile prominent], methods: %i[category_ids])
      end

      render json: @shuffle, status: 200
    end

  end
end
