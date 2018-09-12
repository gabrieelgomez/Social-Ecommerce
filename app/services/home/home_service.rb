module Home

  class HomeService
    # Services #2 independents_by_created_at, Enmachs
    def self.independents(params)
      quantity = params[:quantity].to_i || 10
      Independent.order(created_at: :desc)
                 .first(quantity)
                 .as_json(only: %i[id title photo name type_profile created_at], methods: %i[category_ids follow])
    end

    # Services #3 sellers_by_followers, Enmachs
    def self.sellers(params)
      quantity = params[:quantity].to_i || 10
      Seller.all.sort_by{ |seller| seller.followers_by_type_profile('User', 'Seller').count }
            .reverse
            .first(quantity)
            .as_json(only: %i[id title photo name type_profile created_at], methods: %i[category_ids follow])
    end

    # Services #5 products_by_created_at, Enmachs
    def self.products_by_created_at(params)
      quantity = params[:quantity].to_i || 10
      Product.order(created_at: :desc)
             .first(quantity)
             .as_json(only: %i[id name price created_at])
      # byebug
    end

    # Services #6 products_by_wishes, Enmachs
    def self.products_by_wishes(params)
      quantity = params[:quantity].to_i || 10
      Product.all.sort_by{ |product| product.wishes.count }
             .reverse
             .first(quantity)
             .as_json(only: %i[id name price created_at])
      # byebug
    end

    # --------------------------------------------------------------------------

    # Services #1 profiles_by_created_products, GabrielGomez
    def self.profiles(params)
      quantity = params[:quantity].to_i || 10
      Pyme.all.sort_by{ |profile| (profile.products.map(&:status)-[false]).count }
              .reverse
              .first(quantity)
              .as_json(only: %i[id title photo name type_profile], methods: %i[category_ids follow])
    end

    # Services #4 categories_listing_by_products, GabrielGomez
    def self.categories
      Category.all
              .select { |cat| cat.products.positive? }
              .as_json(
                only: %i[id name],
                methods: %i[products_count]
              )
    end

    # Services #7 categories_by_profiles_nested_products, GabrielGomez
    def self.categories_by_profiles_nested_products
      categories =  Category.all.collect{ |category|
        {
          category_id: category.id,
          category_name: category.name,
          profiles: category.by_sorting_profiles_products
                            .reverse
                            .take(6)
                            .as_json(only: %i[id title photo name type_profile], methods: %i[category_ids follow])
        }
      }.uniq
    end

  end
end
