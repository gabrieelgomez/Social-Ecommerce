module Api::V1::Products
  class ShowController < ProductsController
    before_action :authenticate_v1_user!, only: %i[show_own]
    before_action :public_productable, only: %i[show index]
    before_action :set_product, only: %i[show]
    def index
      byebug
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
  end
end
