module Api::V1::Comments
  class CreateController < CommentsController

    def create
      commentable = commentable_type.constantize.find(commentable_id)
      @comment = Comment.build_from(commentable, current_v1_user.id, body)

      if @comment.save
        make_child_comment
        render json: @comment
      else
        render json: ErrorSerializer.serialize(@comment.errors)
      end
    end

  end
end
