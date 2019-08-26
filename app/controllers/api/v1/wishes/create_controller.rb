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

      if @wish.save
        render json: @wish, status: 200
      else
        render json: @wish.errors, status: 500
      end
    end
  end
end
