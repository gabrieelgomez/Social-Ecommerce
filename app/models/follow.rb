class Follow < ActiveRecord::Base
  after_create :create_notify

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

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

  def create_notify
    recipient = self.followable.user
    sender    = self.follower
    message   = "#{self.follower.name} ha seguido tu perfil #{self.followable.title}"
    #Method for create_notify, in order is recipient, sender, type, message
    Notification.create_notify_models(recipient, sender, 'follow', message)
  end

end
