module Api::V1::ContactTypes
  class CreateController < ContactTypesController
    # before_action :set_postable, only: %i[create]

    def create
      @contact_type = ContactType.new(contact_type_params)
      if @contact_type.save
        render json: @contact_type, status: 200
      else
        render json: @contact_type.errors, status: 422
      end
    end
  end
end
