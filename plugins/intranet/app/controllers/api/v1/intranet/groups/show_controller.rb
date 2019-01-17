module Api::V1::Intranet::Groups
  class ShowController < GroupsController
    before_action :set_intranets, only: %i[index show]
    before_action :set_intranet, only: %i[index show]
    before_action :set_groups, only: %i[index]
    before_action :set_group, only: %i[show]

    def index
      render json: @groups, status: 200
    end

    def show
      render json: @group, status: 200
    end

  end
end
