module Api::V1::Comments
  class ShowController < CommentsController

    def index
      commentable = custom_find {
        params[:commentable_type].modelarize.find(params[:commentable_id])
      }
      render json: commentable.root_comments, status: 200
    end

    def show
      render json: @comment, status: 200
    end

  end
end
