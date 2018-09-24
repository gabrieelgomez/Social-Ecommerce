module Api::V1
  class Comments::CommentsController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]
    before_action :set_comment, only: %i[show update destroy]
    include ::Api::V1::Concerns::ModelModulation

    private

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :commentable_id,
                                      :commentable_type, :comment_id)
    end

    def commentable_type
      comment_params[:commentable_type]
    end

    def commentable_id
      comment_params[:commentable_id]
    end

    def comment_id
      comment_params[:comment_id]
    end

    def body
      comment_params[:body]
    end

    def make_child_comment
      return "" if comment_id.blank?

      parent_comment = Comment.find comment_id
      @comment.move_to_child_of(parent_comment)
    end
  end
end
