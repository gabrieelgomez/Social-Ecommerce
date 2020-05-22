module Api::V1::Comments
  class ShowController < CommentsController

    def index
      comentable_type = Comment.parse_comentable(params[:commentable_type])
      commentable = custom_find {
        comentable_type.modelarize.find(params[:commentable_id])
      }
      render json: commentable.root_comments, status: 200
    end

    def show
      render json: @comment, status: 200
    end

  end
end
