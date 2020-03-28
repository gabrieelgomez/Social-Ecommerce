module Api::V1::Intranet::Lists
  class CreateController < ListsController
    before_action :set_intranet, only: %i[create]

    def create
      @list = Intranet::Lists.new(list_params)
      @list.intranet = @intranet
      if @list.save
        render json: @list, status: 200
      else
        render json: @list.errors, status: 422
      end
    end

  end
end
