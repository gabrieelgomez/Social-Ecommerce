module Api::V1::Wishes
  class ShowController < WishesController
    before_action :authenticate_v1_user!, except: [:wishes_by_user]

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

  end
end
