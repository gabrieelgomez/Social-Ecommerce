class LookForProfile

  def self.search_profiles(search, profiles, categories, states, countries)
    result_by_q = result_by_filters = []

    ['Pyme', 'Seller', 'Independent'].each do |model|
      custom_model = model.constantize
      result_by_q.push(
        custom_model.ransack(title_cont: search).result
      )
      result_by_filters.push(
        custom_model.ransack(title_cont: search).result
                    .ransack(type_profile_in: profiles.try(:map, &:capitalize)).result
                    .ransack(categories_id_in: categories).result
      )
    end

    return result_by_q.flatten.uniq, result_by_filters.flatten.uniq
    # pymes = Pyme.ransack(title_cont: search).result
    #                   .ransack(type_profile_in: profiles.try(:map, &:capitalize)).result
    #                   .ransack(categories_id_in: categories).result
    # pymes.select{|pyme| pyme.search_in?(states, :states_codes)} if states
    # pymes.select{|pyme| pyme.search_in?(countries, :countries_codes)} if countries
  end
end
