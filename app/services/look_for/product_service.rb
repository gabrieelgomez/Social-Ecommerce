module LookFor

  class ProductService

    def self.custom_method(search, profiles, categories, subcategories, states, countries)
      products_by_q = Product.ransack(name_cont: search)
                             .result
                             .where.not(stock:0)
      products_by_filters = products_by_q.ransack(type_profile_in: profiles).result

      prod_ids = products_by_filters.map(&:id)
      products_by_filters = Product.where(id: prod_ids)
                                   .ransack(categories_id_in: categories)
                                   .result
                                   .ransack(subcategories_id_in: subcategories)
                                   .result

      products_by_filters = Product.search_by_countries_states(products_by_filters, states, countries) if countries || states

      #By filters search
      filter_profile_by_products   = FilterService.type_profiles(products_by_q)
      filter_cat_by_products       = FilterService.categories(products_by_q)
      filter_country_by_products   = FilterService.countries(products_by_q)

      filter_profile_by_products   = FilterService.type_profiles(products_by_filters)
      filter_cat_by_products       = FilterService.categories(products_by_filters)
      filter_country_by_products   = FilterService.countries(products_by_filters)

      #End by filter search

      products_by_filters = products_by_filters.uniq.as_json(only: %i[id type_profile name stock price cover created_at updated_at states_codes countries_codes], methods: %i[productable category_ids subcategory_ids links url_get is_wished_by_user])

      return products_by_filters, filter_profile_by_products, filter_cat_by_products, filter_country_by_products

    end

  end

end
