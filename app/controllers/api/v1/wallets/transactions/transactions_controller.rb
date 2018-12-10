module Api::V1::Wallets
	class Transactions::TransactionsController < WalletsController
		before_action :set_wallet, only: %i[wallet_transactions]


		def wallet_transactions
			if current_v1_user.email != 'bigwave.admin@gmail.com'
        render json: {errors: 'Access Denied'}, status: 200
      else
        @wallet = Wallet.find(params[:wallet_id])
				render json: @wallet.transactions, status: 200
			end
		end

    private

    def set_balance
      @current_balance = @wallet.balance
      @amount          = params[:amount].to_f
    end

    def create_transaction
      @transaction = Transaction.new(
        amount: params[:amount].to_f,
        reference: SecureRandom.hex(6),
        type_transfer: @type,
        status: 'paid',
        user: current_v1_user,
        wallet: @wallet,
        coin: @wallet.coin
      )
    end

  end
end
