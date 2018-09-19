module Api::V1::Contacts
  class CreateController < ContactsController
    # before_action :set_postable, only: %i[create]
    # before_action :set_profile, only: %i[create]
    before_action :set_contact_type, only: %i[create]

    def create
      @contact = Contact.new(contact_params)
      # @contact.profile = @profile
      if @contact.save
        render json: @contact, status: 200
      else
        render json: @contact.errors, status: 500
      end
    end

    private

    def set_profile
      @profile = custom_find {
        Profile.find(params[:profile_id])
      }
    end
  end
end
