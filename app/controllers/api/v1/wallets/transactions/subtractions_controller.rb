module Api::V1::Wallets::Transactions
  class SubtractionsController < TransactionsController
    before_action :set_wallet, only: %i[subtract_coins]
    before_action :set_balance, only: %i[subtract_coins]

    def subtract_coins
      @type = 'subtraction'
      create_transaction
      if @transaction.save
        render json: @transaction, status: 200
      else
        render json: @transaction.errors, status: 500
      end
    end

  end
end
