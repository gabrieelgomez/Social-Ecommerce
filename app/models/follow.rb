class Follow < ActiveRecord::Base
  after_create :create_notify_new_follow

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes
  extend ActsAsFollower::Follower
  extend ActsAsFollower::Followable
  # autoload :Follower,     'acts_as_follower/follower'
  # autoload :Followable,   'acts_as_follower/followable'
  # autoload :FollowerLib,  'acts_as_follower/follower_lib'
  # autoload :FollowScopes, 'acts_as_follower/follow_scopes'

  # NOTE: Follows belong to the "followable" and "follower" interface
  belongs_to :followable, polymorphic: true
  belongs_to :follower,   polymorphic: true

  #Object create notify
  notification_object

  def block!
    self.update_attribute(:blocked, true)
  end

  # returns Follow records where followable is the record passed in.
  def self.for_followable_by_profile(followable, profile)
    where(followable_id: followable.id, followable_type: profile)
  end

  def example
    'hello world'
  end

  def create_notify_new_follow
    recipient = followable
    sender    = follower
    message   = "<strong>#{sender.name}</strong> ha seguido tu perfil <strong>#{recipient.title}</strong>"
    return if sender == recipient.user
    #Method for create_notify, in order is recipient, sender, type, message
    Notification.create_notify_models(recipient.user, sender, 'follow', message)
  end

end
