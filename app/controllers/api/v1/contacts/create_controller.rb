module Api::V1::Contacts
  class CreateController < ContactsController
    # before_action :set_postable, only: %i[create]

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        render json: @contact, status: 200
      else
        render json: @contact.errors, status: 500
      end
    end
  end
end
