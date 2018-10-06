class MembershipConversation < ApplicationRecord
  belongs_to :conversation
  belongs_to :memberable, polymorphic: true
end
