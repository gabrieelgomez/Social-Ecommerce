module Api::V1::Intranet::Groups
  class CreateController < GroupsController
    before_action :set_intranet, only: %i[create]

    def create
      @group = Intranet::Group.new(group_params)
      @group.intranet = @intranet
      if @group.save
        render json: @group, status: 200
      else
        render json: @group.errors, status: 422
      end
    end

  end
end
