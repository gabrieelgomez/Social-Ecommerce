module Api::V1::Comments
  class CreateController < CommentsController

    def create
      commentable = commentable_type.constantize.find(commentable_id)
      @comment = Comment.build_from(commentable, current_v1_user.id, body)

      if @comment.save
        make_child_comment
        render json: @comment, status: 200
      else
        render json: @comment.errors,
               status: 422
      end
    end

  end
end
