module Api::V1::Products::Options
	class ActionController < OptionsController
		before_action :authenticate_v1_user!
		before_action :current_user_productable
		before_action :set_product_option
		before_action :set_option, only: [:destroy]

		def create
			@options = Option.new(options_params)
			@options.product = @product
      if @options.save
				render json:{
					status: 'success',
					data:   own_options(params[:profile_id], params[:product_id])
				}
      else
        render json: ErrorSerializer.serialize(@options.errors)
      end
		end

		def destroy
    	if @option.destroy
				render json:{
					status: 'destroyed',
					data:   @option
				}
      else
        render json: ErrorSerializer.serialize(@option.errors)
      end
		end

	end
end
