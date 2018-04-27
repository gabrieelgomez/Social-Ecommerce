class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commentable_id, :commentable_type, :title, :body,
             :subject, :user_id, :parent_id, :lft, :rgt, :parents

  def parents
    comment = self.object
    profile = comment.commentable_type.constantize.find(comment.commentable_id)
    if comment.has_children?
      comment.children
    end
  end

end
