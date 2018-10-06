module Api::V1::Posts
  class UpdateController < PostsController

    before_action :set_own_post, only: %i[update]

    def update
      if @post.update(post_params)
        render json: @post, status: 200
      else
        render json: @post.errors, status: 500
      end
    end
  end
end
