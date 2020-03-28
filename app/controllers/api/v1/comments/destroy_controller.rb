module Api::V1::Comments
  # Destroy controller
  class DestroyController < CommentsController

    def destroy
      if @comment.destroy
        render json: @comment, status: 200
      else
        render json: @comment.errors,
               status: 422
      end
    end

  end
end
