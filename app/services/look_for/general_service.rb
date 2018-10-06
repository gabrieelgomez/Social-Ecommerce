module LookFor

  class GeneralService
    def self.search(params)

      search        = params[:q] || nil
      profiles      = params[:profiles].try(:split, '-')
      categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
      subcategories = params[:subcategories].try(:split, '-').try(:map, &:to_i)
      states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)

      if params[:type_search].eql?('products')
        ProductService.custom_method(search, profiles, categories, subcategories, states, countries)
      elsif params[:type_search].eql?('profiles')
        ProfileService.custom_method(search, profiles, categories, subcategories, states, countries)
      end

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

end
