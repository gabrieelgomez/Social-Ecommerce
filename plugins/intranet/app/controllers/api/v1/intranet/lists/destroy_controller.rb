module Api::V1::Intranet::Lists
  class DestroyController < ListsController
    before_action :set_intranets, only: %i[destroy]
    before_action :set_intranet, only: %i[destroy]
    before_action :set_list, only: %i[destroy]

    def destroy
      if @list.destroy
        render json: @list, status: 200
      else
        render json: @list.errors,
               status: 422
      end
    end

  end
end
