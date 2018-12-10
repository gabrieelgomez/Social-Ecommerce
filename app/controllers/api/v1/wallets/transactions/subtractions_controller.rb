module Api::V1::Wallets::Transactions
  class SubtractionsController < TransactionsController
    # before_action :set_wallet_admin, only: %i[subtract_coins]
    # before_action :set_balance, only: %i[subtract_coins]

    def subtract_coins
      if current_v1_user.email != 'bigwave.admin@gmail.com'
        render json: {errors: 'Access Denied'}, status: 200
      else
        @wallet = Wallet.find(params[:wallet_id])
        @current_balance = @wallet.balance
        @amount          = params[:amount].to_f
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
end
