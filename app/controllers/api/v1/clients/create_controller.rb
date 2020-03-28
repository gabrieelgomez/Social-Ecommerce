module Api::V1::Clients
  class CreateController < ClientsController
    before_action :authenticate_v1_user!,    only: %i[create]
    before_action :set_ownerable,            only: %i[create]
    before_action :verify_ownership_profile, only: %i[create], if: :is_a_crm?

    def create
      @client = Client.new(client_params)
      @client.created_by = 3
      if @client.save
        render json: @client, status: 200
      else
        render json: @client.errors, status: 422
      end
    end

    private

    # Set owner of client
    def set_ownerable
      model = params[:client][:ownerable_type].modelarize
      id = params[:client][:ownerable_id]
      @ownerable = custom_find do
        model.find(id)
      end
    end

    # Verify if profile of crm belongs to current_user
    def verify_ownership_profile
      return if @ownerable.profile.user.eql? current_v1_user

      render json: {
        errors: [
          'You are not authorized to this action.'
        ]
      }, status: 401
    end
  end
end
