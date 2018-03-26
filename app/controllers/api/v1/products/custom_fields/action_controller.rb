module Api::V1::Products::CustomFields
	class ActionController < CustomFieldsController
		before_action :authenticate_user!
		# before_action :set_product, only: [:create]

		def create
			@custom_fields = CustomField.new(custom_fields_params)
      if @custom_fields.save
				render json:{
					status: 'success',
					data:   model_name.find(params[:profile_id]).products.find(params[:product_id]).as_json(root: true, include: :custom_fields)
				}
      else
        render json: ErrorSerializer.serialize(@custom_fields.errors)
      end
		end

	end
end
