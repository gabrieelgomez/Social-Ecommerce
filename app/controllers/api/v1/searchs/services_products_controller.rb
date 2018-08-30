module Api::V1::Searchs
  class ServicesProductsController < ServicesController

    # Services Product: Ultimos products, cantidad y por tipo de product
    def service_product
      # Params
      quantity      = params[:quantity].to_i || 10
      ids = Product.last(quantity).map(&:id)
      categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
      brand = params[:brand].try(:split, '-').try(:map, &:to_s)
      # Falta que se filtren por ofertas mayores a 50%

      # Search Service
      products = Product.where(id:ids)
                        .ransack(categories_id_in: categories).result
                        .ransack(brand_cont: brand).result

      # Result
      @result = products.uniq.as_json(only: [:id, :type_profile, :name, :price, :cover, :created_at, :updated_at, :states_codes, :countries_codes],
                                       methods: [:category_ids, :subcategory_ids, :links])

      render json: @result, status: 200
    end

  end
end
