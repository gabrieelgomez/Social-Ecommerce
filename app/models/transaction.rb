class Transaction < ApplicationRecord

  after_save :update_balance

  belongs_to :coin
  belongs_to :user
  belongs_to :wallet

  # Validations
  validate :wallet_balance
  validates :amount, numericality: { greater_than_or_equal_to: 1}

  def update_balance
    current_balance = wallet.balance
    if type_transfer == 'addition'
      wallet.update(balance: current_balance + amount)
    elsif type_transfer == 'subtraction'
      wallet.update(balance: current_balance - amount)
    end

  end

  def wallet_balance
    current_balance = wallet.balance
    if type_transfer == 'subtraction' && current_balance < amount
      errors.add(:amount, 'Amount not avaible or insufficient balance')
    end
  end

end
