class Conversation < ApplicationRecord
  belongs_to :senderable
  belongs_to :recipientable, polymorphic: true
end
