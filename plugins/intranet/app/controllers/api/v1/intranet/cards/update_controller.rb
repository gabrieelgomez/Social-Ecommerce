module Api::V1::Intranet::Cards
  class UpdateController < CardsController
    before_action :set_intranets, only: %i[update]
    before_action :set_intranet, only: %i[update]
    before_action :set_card, only: %i[update]

    def update
      if @card.update(card_params)
        render json: @card, status: 200
      else
        render json: @card.errors,
               status: 422
      end
    end

  end
end
