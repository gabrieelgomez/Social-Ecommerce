module Api::V1
  class ContactTypes::ContactTypesController < ApiController

    private

    def contact_type_params
      params.require(:contact_type).permit(:name)
    end

    def set_contact_type
      @contact_type = ContactType.find params[:contact_type_id]
    end
  end
end
