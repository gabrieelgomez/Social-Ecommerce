module Api::V1::ContactTypes
  class UpdateController < ContactTypesController
    before_action :set_contact_type, only: %i[update]

    def update
      if @contact_type.update(contact_type_params)
        render json: @contact_type, status: 200
      else
        render json: @contact_type.errors, status: 422
      end
    end
  end
end
