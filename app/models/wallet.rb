class Wallet < ApplicationRecord
  has_many :transactions
  belongs_to :user
  belongs_to :coin

  scope :between, ->(user_id, coin_id) do
    where(user_id: user_id, coin_id: coin_id)
  end

end
