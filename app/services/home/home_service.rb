module Home

  class HomeService
    # Services #2 independents_by_created_at, Enmachs
    def self.independents(params)
      quantity = params[:quantity].to_i || 10
      Independent.order(created_at: :desc)
                 .reject{|i| i.photo.blank?}
                 .first(quantity)
                 .as_json(only: %i[id title slug photo type_profile created_at], methods: %i[category_ids follow])
    end

    # Services #3 sellers_by_followers, Enmachs
    def self.sellers(params)
      quantity = params[:quantity].to_i || 10
      Seller.all
            .reject{|i| i.photo.blank?}
            .sort_by{ |seller| seller.followers_by_type_profile('User', 'Seller').count }
            .reverse
            .first(quantity)
            .as_json(only: %i[id title slug photo type_profile created_at], methods: %i[category_ids follow])
    end

    # Services #5 products_by_created_at, Enmachs
    def self.products_by_created_at(params)
      quantity = params[:quantity].to_i || 10
      Product.order(created_at: :desc)
             .reject{|i| i.cover.url.blank?}
             .first(quantity)
             .as_json(
               only: %i[id cover name price created_at],
               methods: %i[owner wish links url_get]
             )
    end

    # Services #6 products_by_wishes, Enmachs
    def self.products_by_wishes(params)
      quantity = params[:quantity].to_i || 10
      Product.all
             .reject{|i| i.cover.url.blank?}
             .sort_by{ |product| product.wishes.count }
             .reverse
             .first(quantity)
             .as_json(only: %i[id cover name price created_at],
               methods: %i[owner wish links url_get]
             )
    end

    # --------------------------------------------------------------------------

    # Services #1 profiles_by_created_products, GabrielGomez
    def self.profiles(params)
      quantity = params[:quantity].to_i || 10
      Pyme.all
          .reject{|i| i.photo.blank?}
          .sort_by { |profile| (profile.products.map(&:status)-[false]).count }
          .reverse
          .first(quantity)
          .as_json(only: %i[id title slug photo type_profile], methods: %i[category_ids follow])
    end

    # Services #4 categories_listing_by_products, GabrielGomez
    def self.categories
      Category.all
              .select { |cat| cat.products.count.positive? }
              .sort_by(&:products_count)
              .reverse
              .as_json(
                only: %i[id name cover],
                methods: %i[products_count]
              )
    end

    # Services #7 categories_by_profiles_nested_products, GabrielGomez
    def self.categories_by_profiles_nested_products
      categories =  Category.all.collect{ |category|
        {
          id:       category.id,
          name:     category.name,
          profiles: category.by_sorting_profiles_products
                            .reverse
                            .take(6)
                            .as_json(only: %i[id title slug photo type_profile], methods: %i[category_ids follow])
        }
      }.uniq
    end

  end
end
