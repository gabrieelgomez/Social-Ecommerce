module Api::V1
  class Wishes::WishesController < ApiController
    before_action :authenticate_v1_user!

    private

    def wish_params
      params.require(:wish).permit(:user_id, :budget, :name, :priority,
                                   :description, :wisheable_id, :wisheable_type,
                                   :private)
    end

    def verify_and_set_wish
      @wish = Wish.find(params[:wish_id])
      return @wish if @wish.mine?(current_v1_user)
      render json: {
        error: [
          'Register could not be found'
        ]
      }, status: 404
    end
  end
end
