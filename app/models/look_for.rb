class LookFor
  def self.search(params)

    search        = params[:q] || nil
    profiles      = params[:profiles].try(:split, '-')
    categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
    subcategories = params[:subcategories].try(:split, '-').try(:map, &:to_i)
    states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
    countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)

    if params[:type_search].eql?('products')
      products = Product.ransack(name_cont: search).result
                        .ransack(subcategories_id_in: subcategories).result
                        .ransack(type_profile_in: profiles).result
                        .ransack(categories_id_in: categories).result
                        # .ransack(states_codes_in: states).result
                        # .ransack(countries_codes_in: countries).result
      #By filters search
      filter_profile_by_products   = Filter.type_profiles(products)
      filter_cat_by_products       = Filter.categories(products)
      #End by filter search
      products = products.uniq.as_json(only: [:id, :type_profile, :name, :price, :images, :states_codes, :countries_codes],
                                       methods: [:category_ids, :subcategory_ids])
     build_json(products, filter_profile_by_products, filter_cat_by_products)

    elsif params[:type_search].eql?('profiles')
      profiles = search_profiles(search, profiles, categories, states, countries)
      #By filters search
      filter_profile_by_profiles   = Filter.type_profiles(profiles)
      filter_cat_by_profiles       = Filter.categories(profiles)
      #End by filter search
      profiles = profiles.uniq.as_json(only: [:id, :title, :photo, :type_profile], methods: :category_ids)
      build_json(profiles, filter_profile_by_profiles, filter_cat_by_profiles)
    end

    @filters
  end


  def self.build_json(objects, profiles, categories)
    @filters = {
        data: objects,
        filters_by_objects: {
          type_profiles_by_objects:   profiles,
          categories_by_objects:      categories
        }
      }
  end

  def self.search_profiles(search, profiles, categories, states, countries)
    pymes = Pyme.ransack(title_cont: search).result
                      .ransack(type_profile_in: profiles.try(:map, &:capitalize)).result
                      .ransack(categories_id_in: categories).result
                      # .ransack(states_codes_in: states).result
                      # .ransack(countries_codes_in: countries).result,
    sellers = Seller.ransack(title_cont: search).result
                    .ransack(type_profile_in: profiles.try(:map, &:capitalize)).result
                    .ransack(categories_id_in: categories).result
                    # .ransack(states_codes_in: states).result
                    # .ransack(countries_codes_in: countries).result,
    independents = Independent.ransack(title_cont: search).result
                              .ransack(type_profile_in: profiles.try(:map, &:capitalize)).result
                              .ransack(categories_id_in: categories).result
                              # .ransack(states_codes_in: states).result
                              # .ransack(countries_codes_in: countries).result,
    search = pymes, sellers, independents
    search.flatten.uniq
  end


  def self.locations
    states_codes = countries_codes = []
    Profile.all.map do |profile|
      states_codes    += profile.locations.try(:collect, &:state_code)
      countries_codes += profile.locations.try(:collect, &:country_code)
    end
    states_codes = states_codes.uniq; countries_codes = countries_codes.uniq
    return states_codes, countries_codes
  end

end
