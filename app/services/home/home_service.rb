module Home

  class HomeService
    # Services #2 independents_by_created_at, Enmachs
    def self.independents(params)
    end

    # Services #3 sellers_by_followers, Enmachs
    def self.sellers(params)
    end

    # Services #5 products_by_created_at, Enmachs
    def self.products_by_created_at(params)
    end

    # Services #6 products_by_wishes, Enmachs
    def self.products_by_wishes(params)
    end

    # --------------------------------------------------------------------------

    # Services #1 profiles_by_created_products, GabrielGomez
    def self.profiles(params)
      profiles =  Profile.all.collect{ |profile|
        next unless profile.class.eql?(Pyme)
        {
          profile_id: profile.id,
          products_active: (profile.products.map(&:status)-[false]).count,
          products_created: profile.products.count,
          profile_data: [
            type_profile: profile.type_profile,
            banner: profile.banner,
            photo: profile.photo,
            title: profile.title
          ]
        }
      }.uniq
      profiles.shift
      profiles
      # Faltar ordenar este hash de manera asc por la key products_active
    end

    # Services #4 categories_listing_by_products, GabrielGomez
    def self.categories(params)
      Category.all.select{|cat| cat.products.count > 0}
    end

    # Services #7 categories_by_profiles_nested_products, GabrielGomez
    def self.categories_by_profiles_nested_products(params)
      # Response de categorias con profiles que tengan mas productos de esa categoria
      categories =  Category.all.collect{ |category|
        # next unless category.class.eql?(Pyme)
        {
          category_id: category.id,
          profiles: category.by_profiles.count
        }
      }.uniq
      categories
    end


  end

end
