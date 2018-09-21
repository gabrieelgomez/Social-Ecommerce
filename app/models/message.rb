class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :messageable, polymorphic: true

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
