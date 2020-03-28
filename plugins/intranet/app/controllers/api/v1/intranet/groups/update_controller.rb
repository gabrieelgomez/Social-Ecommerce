module Api::V1::Intranet::Groups
  class UpdateController < GroupsController
    before_action :set_intranets, only: %i[update]
    before_action :set_intranet, only: %i[update]
    before_action :set_group, only: %i[update]

    def update
      if @group.update(group_params)
        render json: @group, status: 200
      else
        render json: @group.errors,
               status: 422
      end
    end

  end
end
