module Api::V1::Searchs
  class ServicesController < SearchController

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

  end
end
