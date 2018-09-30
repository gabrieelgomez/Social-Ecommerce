module Api::V1::Clients
  class UpdateController < ClientsController
    before_action :authenticate_v1_user!,    only: %i[update]
    before_action :set_client,               only: %i[update]
    before_action :ownership_profile,        only: %i[update], if: :is_a_crm?

    def update
      if @client.update(client_params)
        render json: @client, status: 200
      else
        render json: @client.errors, status: 500
      end
    end
  end
end
