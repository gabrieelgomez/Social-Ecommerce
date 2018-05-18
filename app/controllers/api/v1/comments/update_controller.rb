module Api::V1::Comments
  # Update controller
  class UpdateController < CommentsController

    def update
      if @comment.update(comment_params)
        render json: @comment, status: 200
      else
        render json: ErrorSerializer.serialize(@comment.errors)
      end
    end

  end
end
