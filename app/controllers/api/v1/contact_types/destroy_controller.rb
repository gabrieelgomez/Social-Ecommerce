module Api::V1::ContactTypes
  class DestroyController < ContactTypesController
    before_action :set_contact_type, only: %i[destroy]

    def destroy
      if @contact_type.destroy
        render json: @contact_type, status: 200
      else
        render json: @contact_type.errors, status: 422
      end
    end
  end
end
