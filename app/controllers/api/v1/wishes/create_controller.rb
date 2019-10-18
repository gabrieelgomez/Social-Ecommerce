module Api::V1::Wishes
  class CreateController < WishesController

    def create
      @wish = Wish.creating(wish_params, params,
                            current_v1_user)

      wisheable = Wish.find_wisheable(wish_params)
      @profile = wisheable.productable
      @sended_wish = SendedWish.new(
        user: current_v1_user,
        profile: @profile,
        wish: @wish
      )
      @wish.sent = true

      have_wish = current_v1_user.wishes.where(wisheable_id: wish_params[:wisheable_id], wisheable_type: wish_params[:wisheable_type])&.count&.positive?

      if have_wish
        render json: {error: 'You have already wished this product'}, status: 200
      elsif @wish.save
        render json: @wish, status: 200
      else
        render json: @wish.errors, status: 500
      end
    end
  end
end
