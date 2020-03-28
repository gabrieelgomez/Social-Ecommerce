module Api::V1::Posts
  class DestroyController < PostsController

    before_action :set_own_post, only: %i[destroy]

    def destroy
      if @post.destroy
        render json: @post, status: 200
      else
        render json: @post.errors, status: 422
      end
    end

  end
end
