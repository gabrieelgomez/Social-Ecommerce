module Intranet
  class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships

    belongs_to :intranet


    def add_memberships(members)
      members.count.times do |id|
        member = self.memberships.new(
          user_id: members[id],
          intranet: intranet,
          profile: intranet.profile
        )
        member.save
      end
    end

    def delete_memberships(members)
      members.count.times do |id|
        memberships.find(members[id]).destroy!
      end
    end

  end
end
