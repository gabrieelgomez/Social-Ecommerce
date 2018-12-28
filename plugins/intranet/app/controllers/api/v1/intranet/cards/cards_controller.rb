module Api::V1::Intranet
	class Cards::CardsController < IntranetController
		before_action :intranets, only: %i[set_intranet]
		before_action :set_intranet, only: %i[set_cards]

		private
		# Callbacks by cards, Set cards by profile current_user
		def set_cards
			@cards = @intranet.cards
		end

		def set_card
			@card = @intranet.cards.find(params[:card_id])
		end

		# Strong params of card
    def card_params
      params.require(:card).permit(:name, :description)
    end

	end
end
