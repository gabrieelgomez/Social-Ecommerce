module LookFor

  class ProductService

    def self.custom_method(search, profiles, categories, subcategories, states, countries)
      products_by_q = Product.ransack(name_cont: search).result
      products_by_filters = products_by_q.ransack(subcategories_id_in: subcategories).result
                                         .ransack(type_profile_in: profiles).result
                                         .ransack(categories_id_in: categories).result
      products_by_filters = products_by_filters.select{|product| product.search_in?(states, :states_codes)} if states
      products_by_filters = products_by_filters.select{|product| product.search_in?(countries, :countries_codes)} if countries


      #By filters search
      filter_profile_by_products   = FilterService.type_profiles(products_by_q)
      filter_cat_by_products       = FilterService.categories(products_by_q)
      filter_country_by_products   = FilterService.countries(products_by_q)
      #End by filter search

      products_by_filters = products_by_filters.uniq.as_json(only: %i[id type_profile name price cover created_at updated_at states_codes countries_codes], methods: %i[category_ids subcategory_ids links])

      return products_by_filters, filter_profile_by_products, filter_cat_by_products, filter_country_by_products
      
    end

  end

end