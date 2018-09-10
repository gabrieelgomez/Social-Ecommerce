module Home

  class HomeService
    # Services #2 independents_by_created_at, Enmachs
    def self.independents(params)
      quantity = params[:quantity] || 10
      Independent.order('created_at DESC')
                 .first(quantity)
                 .as_json(only: %i[id title photo name type_profile])
    end

    # Services #3 sellers_by_followers, Enmachs
    def self.sellers(params)
      quantity = params[:quantity] || 10
      Seller.all.sort_by{ |seller| seller.followers_by_type_profile('User', 'Seller').count }
            .reverse
            .first(quantity)
            .as_json(only: %i[id title photo name type_profile])
    end

    # Services #5 products_by_created_at, Enmachs
    def self.products_by_created_at(params)
      quantity = params[:quantity] || 10
      Product.order('created_at DESC')
             .first(quantity)
             .as_json(only: %i[id name])
      # byebug
    end

    # Services #6 products_by_wishes, Enmachs
    def self.products_by_wishes(params)
      quantity = params[:quantity] || 10
      Product.all.sort_by{ |product| product.wishes.count }
             .reverse
             .first(quantity)
             .as_json(only: %i[id name])
      # byebug
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
        {
          category_id: category.id,
          category_name: category.name,
          profiles: category.profiles_products_active
        }
      }.uniq
      categories
    end

    # private

    # def quantity
    #   params[:quantity] || 10
    # end
  end
end
