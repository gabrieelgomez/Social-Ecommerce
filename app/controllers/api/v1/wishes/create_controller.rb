module Api::V1::Wishes
  class CreateController < WishesController

    def create
      @wish = Wish.creating(wish_params, params,
                            current_v1_user)
      if @wish.save
        render json: @wish, status: 200
      else
        render json: @wish.errors
      end
    end
  end
end