module Api::V1::Products::CustomFields
	class ActionController < CustomFieldsController
		before_action :authenticate_v1_user!
		before_action :current_user_productable
		before_action :set_product_custom_field
		before_action :set_field, only: [:destroy]

		def create
			@custom_fields = @productable.custom_fields.new(custom_fields_params)
			@custom_fields.product = @product
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
					status: 200,
					data:   @custom_field
				}
      else
        render json: ErrorSerializer.serialize(@custom_field.errors)
      end
		end

	end
end
