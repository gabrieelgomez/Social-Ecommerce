module Api::V1::Products
  class ShowController < ProductsController
    before_action :authenticate_v1_user!, only: %i[show_own]
    before_action :public_productable, only: %i[show index wished_products]
    before_action :set_product, only: %i[show]

    include ::Api::V1::Concerns::ProductSearch
    include ::Api::V1::Concerns::ModelModulation

    def index
      if @productable.respond_to? :products
        states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
        countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)

        @products = @productable.products
        @products = Product.search_by_countries_states(@products, states, countries) if countries || states

        render json: @products
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

    def wished_products
      categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
      subcategories = params[:subcategories].try(:split, '-').try(:map, &:to_i)
      search        = params[:q] || nil
      start_date    = params[:start_date]&.to_datetime if params[:start_date]
      end_date      = params[:end_date]&.to_datetime + 1.days if params[:end_date]

      @wished_products = @productable.products
                                     .joins(:wishes)
                                     .includes(:wishes)
                                     .merge(Wish.date_between(start_date, end_date))
                                     .ransack(categories_id_in: categories).result
                                     .ransack(subcategories_id_in: subcategories).result
                                     .where('wishes.id IS NOT NULL')
                                     # .order('wishes.id asc')
                                     # .left_joins(:wishes)

      @wished_products = Product.where(id: @wished_products.pluck(:id)).ransack(name_cont: search).result unless search.nil?
      @wished_products = @wished_products.sort_by{|product| product.last_wish_date}.reverse if @wished_products

      @wished_products = @wished_products.uniq.as_json(
                                            only: %i[id cover name price created_at],
                                            methods: %i[owner total_wishes links url_get]
                                          )

      @result = Kaminari.paginate_array(@wished_products).page(params[:page]).per(params[:per_page])
      @total = @wished_products

      render json: {
            data: @result,
            meta: set_meta_pagination
        }, status: 200

    end

    def sorting_by
      states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
      countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)
      @sorted_by_wishes = Product.sorter_by_wish(params[:order])
      @sorted_by_wishes = @sorted_by_wishes.select{|product| product.search_in?(states, :states_codes)} if states
      @sorted_by_wishes = @sorted_by_wishes.select{|product| product.search_in?(countries, :countries_codes)} if countries

      render json: @sorted_by_wishes, status: 200
      # Product.all
    end

    private

    def set_meta_pagination
      PaginationService.build_meta(@result, @total, params[:per_page], request)
    end

  end
end
