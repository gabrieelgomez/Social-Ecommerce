module Api::V1
  class Contacts::ContactsController < ApiController

    private

    def contact_params
      params.require(:contact).permit(
        :name, :email, :contact_type_id, :comments,
        :phone, :country, :profile_id
      )
    end

    def set_contact
      @contact = custom_find {
        Contact.find(params[:contact_id])
      }
    end

    def set_contact_type
      @contact_type = custom_find {
        ContactType.find(params[:contact_type_id])
      }
    end
  end
end
