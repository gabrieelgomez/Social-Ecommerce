module Api::V1::ContactTypes
  class ShowController < ContactTypesController
    before_action :set_contact_type, only: %i[show]

    def show
      render json: @contact_type, status: 200
    end

    def index
      @contact_types = ContactType.all
      render json: @contact_types, status: 200
    end
  end
end
