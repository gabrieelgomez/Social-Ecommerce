module Api::V1::Contacts
  class ShowController < ContactsController
    before_action :authenticate_v1_user!, only: %i[index show]
    before_action :verify_superadmin_rol, only: %i[index show]
    before_action :set_contact, only: %i[show]

    def show
      render json: @contact, status: 200
    end

    def index
      @contacts = Contact.all
      render json: @contacts, status: 200
    end
  end
end
