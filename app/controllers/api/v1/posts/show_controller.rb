module Api::V1::Posts
  class ShowController < PostsController

    before_action :set_post, only: %i[show]

    def index
      @posts = Post.all
      render json: @posts, status: 200
    end

    def show
      render json: @post, status: 200
    end
  end
end
