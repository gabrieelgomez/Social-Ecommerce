module Api::V1::WaveCitizen::Items
  class ShowController < ItemsController
    before_action :set_current_user_support
    before_action :set_item, only: [:show]

    def index
      render json: WaveCitizen::Item.all.order(id: :asc), status: 200
    end

    def show
      render json: @item, status: 200
    end

  end
end
