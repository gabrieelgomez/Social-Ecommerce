module Api::V1::Intranet::Lists
  class ShowController < ListsController
    before_action :set_intranets, only: %i[index show]
    before_action :set_intranet, only: %i[index show]
    before_action :set_lists, only: %i[index]
    before_action :set_list, only: %i[show]

    def index
      render json: @lists, status: 200
    end

    def show
      render json: @list, status: 200
    end

  end
end
