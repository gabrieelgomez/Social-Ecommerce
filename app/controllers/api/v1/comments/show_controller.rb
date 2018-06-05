module Api::V1::Comments
  class ShowController < CommentsController

    def index
      commentable = custom_find { 
        model_name.find(params[:profile_id])
      }
      render json: commentable.root_comments_profile, status: 200
    end

    def show
      render json: @comment, status: 200
    end

  end
end
