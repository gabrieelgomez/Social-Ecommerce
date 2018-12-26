module Api::V1::Intranet::Groups
  class DestroyController < GroupsController
    before_action :set_intranets, only: %i[destroy]
    before_action :set_intranet, only: %i[destroy]
    before_action :set_group, only: %i[destroy]

    def destroy
      if @group.destroy
        render json: @group, status: 200
      else
        render json: @group.errors,
               status: 500
      end
    end

  end
end
