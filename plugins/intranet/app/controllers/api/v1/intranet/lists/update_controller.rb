module Api::V1::Intranet::Lists
  class UpdateController < ListsController
    before_action :set_intranets, only: %i[update]
    before_action :set_intranet, only: %i[update]
    before_action :set_list, only: %i[update]

    def update
      if @list.update(list_params)
        render json: @list, status: 200
      else
        render json: @list.errors,
               status: 500
      end
    end

  end
end
