class LookFor
  def self.search(params)

    search        = params[:q] || nil
    profiles      = params[:profiles].try(:split, '-')
    categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
    subcategories = params[:subcategories].try(:split, '-').try(:map, &:to_i)
    states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
    countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)

    # product_json = Product.select{ |product| product.mapeo_categorias(categories) } if params[:categories]

    products = Product.ransack(name_cont: search).result
                      .ransack(subcategories_id_in: subcategories).result
                      .ransack(type_profile_in: profiles).result
                      .ransack(categories_id_in: categories).result
                      # .ransack(states_codes_in: states).result
                      # .ransack(countries_codes_in: countries).result

    #By filters search
    filter_profile_by_products   = Filter.type_profiles(products)
    filter_cat_by_products       = Filter.categories(products)

    # filter_profile_by_products   = nil
    # filter_cat_by_products       = nil

    #End by filter search

    profiles = Profile.ransack(title_cont: search).result
                      .ransack(type_profile_in: profiles.try(:map, &:capitalize)).result
                      # .ransack(categories_id_in: categories).result
                      # .ransack(states_codes_in: states).result
                      # .ransack(countries_codes_in: countries).result

    #By filters search
    filter_profile_by_profiles   = Filter.type_profiles(profiles)
    filter_cat_by_profiles       = Filter.categories(profiles)
    #End by filter search


    products = products.uniq.as_json(only: [:id, :type_profile, :name, :price, :images, :states_codes, :countries_codes],
                                     methods: [:category_ids, :subcategory_ids])
    profiles = profiles.uniq.as_json(only: [:id, :title, :photo, :type_profile, :category_ids])


    return products, profiles, filter_profile_by_products, filter_cat_by_products, filter_profile_by_profiles, filter_cat_by_profiles
  end

  def self.locations

    states_codes = []
    countries_codes = []

    Profile.all.map do |profile|
      states_codes    += profile.locations.try(:collect, &:state_code)
      countries_codes += profile.locations.try(:collect, &:country_code)
    end

    states_codes = states_codes.uniq; countries_codes = countries_codes.uniq

    return states_codes, countries_codes
  end

end
