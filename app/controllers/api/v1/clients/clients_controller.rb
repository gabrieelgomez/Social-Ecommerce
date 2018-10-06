module Api::V1
  class Clients::ClientsController < ApiController

    private

    # Find client by given ID
    def set_client
      @client = Client.find(params[:client_id])
    end

    # Strong params of client
    def client_params
      params.require(:client).permit(
        :name, :email, :avatar, :ownerable_id, :ownerable_type,
        :clientable_id, :clientabble_type, :created_by
      ).merge(
        ownerable: @ownerable,
        clientable: @clientable
      )
    end

    # If ownerable_type is a CustomerManagement
    def is_a_crm?
      params[:client][:ownerable_type] == 'CustomerManagement'
    end

    # If client belongs to profile of current_user
    def ownership_profile
      return if @client.ownerable.profile.user.eql? current_v1_user

      render json: {
        errors: [
          "You are not authorized to this action."
        ]
      }, status: 401
    end
  end
end
