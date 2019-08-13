module Api::V1::Wishes
  class ShowController < WishesController
    before_action :authenticate_v1_user!, except: [:wishes_by_user, :wished_products]
    before_action :set_product, only: %[wished_products]

    def my_wishes
      @user      = current_v1_user
      categories = params[:categories].try(:split, '-').try(:map, &:to_i)

      @wishes    = @user.wishes
      if categories
        ids      = current_v1_user.wishes.map(&:wisheable).pluck(:id)
        products = Product.where(id: ids)
                          .ransack(categories_id_in: categories)
                          .result
        @wishes  = current_v1_user.wishes.where(wisheable_id: products.pluck(:id))
      end

      render json: @wishes, status: 200
    end

    def wishes_by_user
      @wishes =  User.find_by(id: params[:user_id]).wishes
      render json: @wishes, status: 200
    end

    def wished_products
      response   = params[:response] || false
      start_date = params[:start_date]
      end_date   = params[:end_date]

      @wishes  = @product.wishes.where(response: response).date_between(start_date, end_date)
      @wishes  = @wishes.as_json(only: %i[id name budget prority response sent private description created_at updated_at deleted_at], methods: %i[user wisheable])
      @result  = Kaminari.paginate_array(@wishes).page(params[:page]).per(params[:per_page])
      @total   = @wishes

      render json: {
            data: @result,
            meta: set_meta_pagination
        }, status: 200, each_serializer: WishSerializer
    end

    private

    def set_product
      @product = Product.find_by id: params[:product_id]
    end

    def set_meta_pagination
      PaginationService.build_meta(@result, @total, params[:per_page], request)
    end

  end
end
