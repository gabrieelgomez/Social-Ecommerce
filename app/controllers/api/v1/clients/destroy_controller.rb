module Api::V1::Clients
  class DestroyController < ClientsController
    before_action :authenticate_v1_user!,    only: %i[destroy]
    before_action :set_client,               only: %i[destroy]
    before_action :ownership_profile,        only: %i[destroy], if: :is_a_crm?

    def destroy
      if @client.destroy
        render json: @client, status: 200
      else
        render json: @client.errors, status: 422
      end
    end
  end
end
