module Api::V1::Comments
  class ShowController < CommentsController

    def index
      commentable = model_name.find(params[:profile_id])
      render json: commentable.root_comments_profile
    end

    def show
      render json: @comment
    end

  end
end
