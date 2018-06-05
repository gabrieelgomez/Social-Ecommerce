module Api::V1::Products::CustomFields
  class ShowController < CustomFieldsController

    def index
      render json: own_custom_fields(params[:profile_id], params[:product_id]),
             status: 200
    end
  end
end
