module Api::V1::Wallets::Transactions
  class AdditionsController < TransactionsController
    # before_action :set_wallet_admin, only: %i[add_coins]
    # before_action :set_balance, only: %i[add_coins]
    # before_action :validate_balance, only: %i[add_coins]

    def add_coins
      if current_v1_user.email != 'bigwave.admin@gmail.com'
        render json: {errors: 'Access Denied'}, status: 200
      else
        @wallet = Wallet.find(params[:wallet_id])
        @current_balance = @wallet.balance
        @amount          = params[:amount].to_f
        @type = 'addition'
        create_transaction
        if @transaction.save
          render json: @transaction, status: 200
        else
          render json: @transaction.errors, status: 422
        end
      end
    end

  end
end
