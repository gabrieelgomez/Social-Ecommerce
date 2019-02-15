module Api::V1
  class Services::ServicesController < ApiController

    def products_filters
      # Params
      id               = params[:profile_id]
      subcategories    = params[:subcategories].try(:split, '-').try(:map, &:to_i)
      profile          = Profile.where(id: id).first

      # Search Service
      products = profile.products.ransack(subcategories_id_in: subcategories).result

      # Result
      @result = products.uniq.as_json(only: %i[id type_profile name stock price cover photo],
                                       methods: %i[subcategory_ids links url_get])

      render json: @result, status: 200

    end

  end
end
