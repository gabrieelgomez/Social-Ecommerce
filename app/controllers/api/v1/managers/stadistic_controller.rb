module Api::V1::Managers
  class StadisticController < ManagersController

    def profiles_numbers
      @profiles_graph = {
        profiles: {
          quantity: {
            all: Profile.count,
            pymes: Pyme.count,
            sellers: Seller.count,
            independents: Independent.count
          }
        }
      }
    end

    def users_numbers
      @users_graph = {
        users: {
          quantity: User.count
        }
      }
    end

    def category_products
      @categories_graph = {
        products: Product.count,
        categories: {},
        subcategories: {}
      }
      Category.all.map do |cat|
        @categories_graph[:categories][cat.name] = 0
        cat.subcategories.map do |subcat|
          @categories_graph[:subcategories][subcat.name] = subcat.products.count
          @categories_graph[:categories][cat.name] += subcat.products.count
        end
      end
      render json: @categories_graph, status: 200
    end

    # def subcategory_products
    #   @subcategories_graph = {
    #     subcategories: {}
    #   }
    #   Subcategory.all.map do |subcat|
    # end
  end
end
