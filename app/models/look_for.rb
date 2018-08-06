class LookFor
  def self.search(params)

    search        = params[:q] || nil
    profiles      = params[:profiles].try(:split, '-')
    categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
    subcategories = params[:subcategories].try(:split, '-').try(:map, &:to_i)
    states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
    countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)

    if params[:type_search].eql?('products')
      products_by_q = Product.ransack(name_cont: search).result
      products_by_filters = products_by_q.ransack(subcategories_id_in: subcategories).result
                                         .ransack(type_profile_in: profiles).result
                                         .ransack(categories_id_in: categories).result
      products_by_filters = products_by_filters.select{|product| product.search_in?(states, :states_codes)} if states
      products_by_filters = products_by_filters.select{|product| product.search_in?(countries, :countries_codes)} if countries


      #By filters search
      filter_profile_by_products   = Filter.type_profiles(products_by_q)
      filter_cat_by_products       = Filter.categories(products_by_q)
      filter_country_by_products   = Filter.countries(products_by_q)
      #End by filter search

      products_by_filters = products_by_filters.uniq.as_json(only: [:id, :type_profile, :name, :price, :cover, :created_at, :updated_at, :states_codes, :countries_codes],
                                       methods: [:category_ids, :subcategory_ids, :links])

      build_json(products_by_filters, filter_profile_by_products, filter_cat_by_products, filter_country_by_products)

    elsif params[:type_search].eql?('profiles')
      profiles = LookForProfile.search_profiles(search, profiles, categories, states, countries)
      #By filters search
      filter_profile_by_profiles   = Filter.type_profiles(profiles[0])
      filter_cat_by_profiles       = Filter.categories(profiles[0])
      filter_country_by_products   = Filter.countries(profiles[0])

      #End by filter search
      profiles[1] = profiles[1].uniq.as_json(only: [:id, :title, :photo, :created_at, :updated_at, :type_profile], methods: :category_ids)
      build_json(profiles[1], filter_profile_by_profiles, filter_cat_by_profiles, filter_country_by_products)
    end

    @filters
  end


  def self.build_json(objects, profiles, categories, countries)
    @filters = {
        data: objects,
        filters_by_objects: {
          type_profiles_by_objects:   profiles,
          categories_by_objects:      categories,
          countries_by_objects:       countries
        }
      }
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
