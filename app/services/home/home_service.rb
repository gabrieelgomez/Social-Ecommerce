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
    def self.profiles
      Pyme.all.sort_by{ |profile| (profile.products.map(&:status)-[false]).count }.reverse.as_json(only: [:id, :title, :photo, :created_at, :updated_at, :type_profile], methods: :category_ids)
    end

    # Services #4 categories_listing_by_products, GabrielGomez
    def self.categories
      Category.all.select{|cat| cat.products.count > 0}
    end

    # Services #7 categories_by_profiles_nested_products, GabrielGomez
    def self.categories_by_profiles_nested_products
      # Response de categorias con profiles que tengan mas productos de esa categoria
      categories =  Category.all.collect{ |category|
        {
          category_id: category.id,
          category_name: category.name,
          profiles: category.by_profiles.sort_by{|profile| profile.products.select{|product| product.category_ids.include?(category.id) }.count}.reverse.take(6).as_json(only: [:id, :title, :photo, :created_at, :updated_at, :type_profile], methods: :category_ids)
          # profiles: category.profiles_products_active
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
