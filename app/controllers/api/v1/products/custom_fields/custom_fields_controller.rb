module Api::V1::Products
	class CustomFields::CustomFieldsController < ProductsController
		before_action :authenticate_v1_user!

		private

		#Concerns pendientes para ser modularizados
		def custom_fields_params
			params.require(:custom_fields).permit(:name, :product_id)
		end

		def set_field
			@custom_field = CustomField.find(params[:field_id])
		end

		def set_product_custom_field
			@product = @productable.products.find(params[:product_id])
		end

		def own_custom_fields(profile, product)
			model_name.find(profile).products.find(product).as_json(root: true, include: :custom_fields)
		end
		#----

	end
end