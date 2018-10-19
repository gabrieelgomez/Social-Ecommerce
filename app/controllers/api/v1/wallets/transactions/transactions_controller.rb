module Api::V1::Wallets
	class Transactions::TransactionsController < WalletsController
		before_action :set_wallet, only: %i[wallet_transactions]


		def wallet_transactions
			render json: @wallet.transactions, status: 200
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
