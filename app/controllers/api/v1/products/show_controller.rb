module Api::V1::Products
  class ShowController < ProductsController
    before_action :authenticate_v1_user!, only: %i[show_own]
    before_action :public_productable, only: %i[show index wished_ones]
    before_action :set_product, only: %i[show]

    include ::Api::V1::Concerns::ProductSearch
    include ::Api::V1::Concerns::ModelModulation

    def index
      if @productable.respond_to? :products
        render json: @productable.products
      else
        render json: { data: [], errors: 'No products found' }, status: 402
      end
    end

    def show
      render json: @product, status: 200
    end

    def search_tag
      @tags = params[:tags].gsub(/[\[\]]/, '').split(',')
      result = Product.tagged_with(@tags, :any => true)
      render json: result, status: 200
    end

    def show_own
      @products = []
      direct_staff = current_v1_user.pymes.to_a.concat(current_v1_user.independents.to_a)
      direct_staff.each do |thing|
        @products += thing.try(:products)
      end
      render json: @products
      # current_user.independents
    end

    def subcat_enabled
      @subcategories = product.categories.reverse.collect{|cat| {category: cat.name, subcategories: cat.subcategories}}
      render json: @subcategories.to_json, status: 200
    end

    def product
      @product = Profile.find(params[:profile_id])
    end

    def all
      render json: Product.all, status: 200
    end

    def wished_ones
      @wished_products = @productable.products.select(&:wished?)
      render json: @wished_products, status: 200
    end

    def sorting_by
      @sorted_by_wishes = Product.sorter_by_wish(params[:order])
      render json: @sorted_by_wishes, status: 200
      # Product.all
    end
  end
end
