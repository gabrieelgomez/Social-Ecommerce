module Api::V1::Wallets::Transactions
  class AdditionsController < TransactionsController
    before_action :set_wallet, only: %i[add_coins]
    before_action :set_balance, only: %i[add_coins]
    # before_action :validate_balance, only: %i[add_coins]

    def add_coins
      @type = 'addition'
      create_transaction
      if @transaction.save
        render json: @transaction, status: 200
      else
        render json: @transaction.errors, status: 500
      end
    end

  end
end
