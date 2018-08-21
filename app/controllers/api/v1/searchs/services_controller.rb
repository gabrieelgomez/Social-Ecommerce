module Api::V1::Searchs
  class ServicesController < SearchController
    before_action :authenticate_v1_user!, only: [:suggest_query]

    def filters_by_cat
      # Params
      category = params[:category].to_i

      # Search service
      category = Category.find(category) rescue nil
      pymes        = category.pymes
      sellers      = category.sellers
      independents = category.independents
      products     = category.products
                     .uniq.as_json(only: [:id, :type_profile, :name, :price, :cover, :created_at, :updated_at, :states_codes, :countries_codes],
                                       methods: [:category_ids, :subcategory_ids, :links])

      profiles     = (pymes + sellers + independents)
                     .uniq.as_json(only: [:id, :title, :photo, :prominent, :created_at, :updated_at, :type_profile], methods: :category_ids)

      # Result
      @result = profiles + products

      render json: @result, status: 200
    end

    def suggest_query
      categories_products = current_v1_user.map_suggest('Product')
      categories_profiles = current_v1_user.map_suggest('Profile')


      @shuffle = Category.find(categories_products).map{|category| category.products.sample(5)}
                         .flatten
                         .uniq.as_json(only: [:id, :type_profile, :name, :price, :cover, :created_at, :updated_at, :states_codes, :countries_codes],
                                             methods: [:category_ids, :subcategory_ids, :links])


      if @shuffle.nil?
        @shuffle = Category.find(categories_profiles).map{|category|
          category.pymes.sample(2) + category.sellers.sample(2) + category.independents.sample(2)}
          .flatten
          .uniq.as_json(only: [:id, :title, :photo, :prominent, :created_at, :updated_at, :type_profile], methods: :category_ids)
      end

      render json: @shuffle, status: 200
    end

  end
end
