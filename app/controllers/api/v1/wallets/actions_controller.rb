module Api::V1::Wallets
  class ActionsController < WalletsController
    before_action :set_my_wallets, only: %i[my_wallets]
    before_action :set_wallet, only: %i[wallet]

    def my_wallets
      if @wallets
        render json: @wallets, status: 200
      else
        render json: @wallets.errors, status: 422
      end
    end

    def wallet
      if @wallet
        render json: @wallet, status: 200
      else
        render json: @wallet.errors, status: 422
      end
    end

  end
end
