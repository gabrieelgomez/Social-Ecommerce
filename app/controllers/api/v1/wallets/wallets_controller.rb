module Api::V1
  class Wallets::WalletsController < ApiController
    before_action :authenticate_v1_user!

    private

		def set_my_wallets
      @wallets = current_v1_user.wallets
		end

    def set_wallet
      @wallet = custom_find {
        current_v1_user.wallets.find(params[:wallet_id])
      }
		end

  end
end
