class SendedWish < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  belongs_to :wish
end
