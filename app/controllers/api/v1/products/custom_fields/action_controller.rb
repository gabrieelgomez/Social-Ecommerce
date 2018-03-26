module Api::V1::Products::CustomFields
	class ActionController < CustomFieldsController
		before_action :authenticate_user!
		before_action :set_field, only: [:destroy]

		def create
			@custom_fields = CustomField.new(custom_fields_params)
      if @custom_fields.save
				render json:{
					status: 'success',
					data:   own_custom_fields(params[:profile_id], params[:product_id])
				}
      else
        render json: ErrorSerializer.serialize(@custom_fields.errors)
      end
		end

		def destroy
    	if @custom_field.destroy
				render json:{
					status: 'destroyed',
					data:   @custom_field
				}
      else
        render json: ErrorSerializer.serialize(@custom_field.errors)
      end
		end

	end
end
