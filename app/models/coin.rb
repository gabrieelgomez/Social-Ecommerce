class Coin < ApplicationRecord

  # Relationships
  has_many :wallets
  has_many :transactions
end
