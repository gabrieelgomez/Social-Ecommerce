module Api::V1
	class Products::Options::OptionsController < ApiController
		before_action :authenticate_user!

		private

		#Concerns pendientes para ser modularizados
		def options_params
			params.require(:options).permit(:name)
		end

		def set_option
			@option = CustomField.find(params[:option_id])
		end

		def own_options(profile, product)
			# model_name.find(profile).products.find(product).as_json(root: true, include: :options)
		end
		#----

	end
end
