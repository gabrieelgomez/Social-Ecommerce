class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commentable_id, :commentable_type, :title, :body,
             :subject, :parent_id, :lft, :rgt, :created_at, :updated_at,
             :body_update, :user, :childrens,
             :commentable_all_comments

  def commentable_all_comments
    object.commentable.root_comments.as_json(except: %i[title subject],
                                             include: {
                                               user: {
                                                 only: %i[id email name nickname 
                                                          avatar]
                                               }
                                             })
  end

  def childrens
    comment = self.object
    profile = comment.commentable_type.constantize.find(comment.commentable_id)
    comment.children.as_json(
      except: %i[title subject],
      include: {
        user: {
          only: %i[id email name nickname avatar]
        }
      }
    ) if comment.has_children?
  end

  def user
    comment = self.object
    comment.user.as_json(only: %i[id email name nickname avatar])
  end

end
