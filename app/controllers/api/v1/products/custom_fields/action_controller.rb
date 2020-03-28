module Api::V1::Products::CustomFields
  class ActionController < CustomFieldsController
    before_action :authenticate_v1_user!
    before_action :current_user_productable
    before_action :set_product_custom_field
    before_action :set_field, only: [:destroy]

    def create
      if custom_ids.include?(:custom_field_ids)
        create_custom_ids
      else
        @custom_fields = @productable.custom_fields.new(custom_fields_params)
        @custom_fields.product_ids = @product.id
        if @custom_fields.save
          render json: own_custom_fields(params[:profile_id], params[:product_id]),
                 status: 200
        else
          render json: @custom_fields.errors, status: 422
        end
      end
    end

    def create_custom_ids
      @product.update(custom_field_ids: custom_ids[:custom_field_ids])
      if @product.save
        render json: own_custom_fields(params[:profile_id], params[:product_id]),
               status: 200
      else
        render json: @product.errors, status: 422
      end

    end

    def destroy
      if @custom_field.destroy
        render json: @custom_field, status: 200
      else
        render json: @custom_field.errors, status: 422
      end
    end

  end
end
