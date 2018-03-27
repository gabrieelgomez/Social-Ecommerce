module Api::V1::Products::Options
	class ShowController < OptionsController

		def index
			render json:{
				status: 'success',
				# data:   own_options(params[:profile_id], params[:product_id])
			}
		end

	end
end
