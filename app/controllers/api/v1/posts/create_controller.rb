module Api::V1::Posts
  class CreateController < PostsController

    before_action :set_postable, only: %i[create]

    def create
      @post = @postable.posts.new(post_params)
      if @post.save
        render json: @post, status: 200
      else
        render json: @post.errors, status: 500
      end
    end
  end
end
