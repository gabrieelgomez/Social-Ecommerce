module Api::V1::Products::CustomFields
	class ShowController < CustomFieldsController

		def index
			render json:{
				status: 'success',
				data:   own_custom_fields(params[:profile_id], params[:product_id])
			}
		end

	end
end
