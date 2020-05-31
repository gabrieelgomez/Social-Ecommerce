# frozen_string_literal: true

module Api::V1::Comments
  # Comments CreateController
  class CreateController < CommentsController
    def create
      commentor = (current_v1_user&.citizen || current_v1_user)
      commentable = commentable_type.constantize.find(commentable_id)
      @comment = Comment.build_from(commentable, commentor, body)

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
