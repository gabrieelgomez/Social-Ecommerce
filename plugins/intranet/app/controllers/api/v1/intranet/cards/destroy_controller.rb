module Api::V1::Intranet::Cards
  class DestroyController < CardsController
    before_action :set_intranets, only: %i[destroy]
    before_action :set_intranet, only: %i[destroy]
    before_action :set_card, only: %i[destroy]

    def destroy
      if @card.destroy
        render json: @card, status: 200
      else
        render json: @card.errors,
               status: 422
      end
    end

  end
end
