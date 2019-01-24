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
      @result = products.uniq.as_json(only: %i[id type_profile name price cover],
                                       methods: %i[category_ids subcategory_ids links url_get])

      render json: @result, status: 200
    end

  end
end
