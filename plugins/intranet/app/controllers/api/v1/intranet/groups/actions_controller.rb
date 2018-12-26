module Api::V1::Intranet::Groups
  class ActionsController < GroupsController
    before_action :set_intranets
    before_action :set_intranet
    before_action :set_group

    def add_memberships
      @members = params[:members]
      @group.add_memberships(@members)
      render json: @group.memberships.where.not(id: nil), status: 200
    end

    def delete_memberships
      @members = params[:members]
      @group.delete_memberships(@members)
      render json: @group.memberships, status: 200
    end

    def set_member
      @member = @group.memberships.find(params[:membership_id])
      render json: @member, status: 200
    end

    def set_memberships
      @memberships = @group.memberships
      render json: @memberships, status: 200
    end

  end
end
