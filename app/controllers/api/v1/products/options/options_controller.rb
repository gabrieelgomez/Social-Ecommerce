module Api::V1::Products
	class Options::OptionsController < ProductsController
		before_action :authenticate_v1_user!

		private

		#Concerns pendientes para ser modularizados
		def options_params
			params.require(:options).permit(:name, :product_id)
		end

		def set_option
			@option = CustomField.find(params[:option_id])
		end

		def set_product_option
			@product = @productable.products.find(params[:product_id])
		end

		def own_options(profile, product)
			model_name.find(profile).products.find(product).as_json(root: true, include: :options)
		end
		#----

	end
end
