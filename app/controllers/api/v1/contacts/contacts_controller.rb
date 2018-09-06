module Api::V1
  class Contacts::ContactsController < ApiController

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :contact_type_id, :comments,
                                      :phone, :country)
    end

    def set_contact
      @contact = Contact.find params[:contact_id]
    end
  end
end
