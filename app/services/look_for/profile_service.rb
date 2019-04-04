module LookFor

  class ProfileService

    def self.custom_method(search, type_profile, categories, subcategories, states, countries)

      profiles = search_profiles(search, type_profile, categories, states, countries)
      #By filters search
      filter_profile_by_profiles   = FilterService.type_profiles(profiles[0])
      filter_cat_by_profiles       = FilterService.categories(profiles[0])
      filter_country_by_products   = FilterService.countries(profiles[0])

      #End by filter search
      profiles[1] = profiles[1].uniq.as_json(only: %i[id title slug photo created_at updated_at type_profile countries_codes states_codes], methods: :category_ids)
      return profiles[1], filter_profile_by_profiles, filter_cat_by_profiles, filter_country_by_products
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

    def self.search_profiles(search, type_profile, categories, states, countries)
      result_by_q = []
      result_by_filters = []

      ['Pyme', 'Seller', 'Independent'].each do |model|
        custom_model = model.constantize
        result_by_q.push(
          custom_model.ransack(title_cont: search).result
        )

        profiles = custom_model.ransack(title_cont: search).result
                               .ransack(type_profile_in: type_profile.try(:map, &:capitalize)).result
                               .ransack(categories_id_in: categories).result

        profiles = Profile.search_by_countries_states(profiles, states, countries) if countries || states

        result_by_filters.push(profiles)
      end

      return result_by_q.flatten.uniq, result_by_filters.flatten.uniq

    end

  end
end
