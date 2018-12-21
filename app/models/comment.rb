class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  before_save :set_change_body, if: :body_changed? #:saved_change_to_body?
  after_create :create_notify_new_comment

  validates :body, :commentable_id, :commentable_type, :user, presence: true

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a user
  belongs_to :user

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a user_id, and comment text
  # example in readme
  def self.build_from(obj, user_id, comment)
    new \
      :commentable_id   => obj.id,
      :commentable_type => obj.class.name,
      :body             => comment,
      :user_id          => user_id,
      :body_update      => false
  end

  #helper method to check if a comment has children
  def has_children?
    children.any?
  end

  def set_change_body
    self.body_update = true unless body_was.nil?
  end

  def create_notify_new_comment
    recipient = commentable
    sender    = user
    case commentable.class.to_s
      when 'Pyme'
        return if sender == recipient.user
        message   = "<strong>#{sender.name}</strong> ha comentado tu perfil <strong>#{recipient.title}</strong>"
        recipient = recipient.user
      when 'Seller'
        return if sender == recipient.user
        message   = "<strong>#{sender.name}</strong> ha comentado tu perfil <strong>#{recipient.title}</strong>"
        recipient = recipient.user
      when 'Independent'
        return if sender == recipient.user
        message   = "<strong>#{sender.name}</strong> ha comentado tu perfil <strong>#{recipient.title}</strong>"
        recipient = recipient.user
      when 'Post'
        message   = "<strong>#{sender.name}</strong> ha comentado tu publicación <strong>#{recipient.content.truncate(40)}</strong>"
        recipient = recipient.postable
        users = commentable.comments.map(&:user).map(&:id)
        return if sender == recipient || users.include?(sender.id)
    end # End case

    Notification.create_notify_models(recipient, sender, 'comment', message) if message
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given user.
  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    comment_threads.where(parent_id: nil)
    # where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
end
