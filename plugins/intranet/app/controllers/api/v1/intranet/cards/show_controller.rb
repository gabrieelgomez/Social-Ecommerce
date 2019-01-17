module Api::V1::Intranet::Cards
  class ShowController < CardsController
    before_action :set_intranets, only: %i[index show]
    before_action :set_intranet, only: %i[index show]
    before_action :set_cards, only: %i[index]
    before_action :set_card, only: %i[show]

    def index
      render json: @cards, status: 200
    end

    def show
      render json: @card, status: 200
    end

  end
end
