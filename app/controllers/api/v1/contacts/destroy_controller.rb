# frozen_string_literal: true

module Api::V1::Contacts
  class DestroyController < ContactsController
    before_action :authenticate_v1_user!, only: %i[destroy]
    before_action :verify_superadmin_rol, only: %i[destroy]
    before_action :set_contact, only: %i[destroy]

    def destroy
      if @contact.destroy
        render json: @contact, status: 200
      else
        render json: @contact.errors, status: 500
      end
    end
  end
end
