module Api::V1::Products::Options
  class ActionController < OptionsController
    before_action :authenticate_v1_user!
    before_action :current_user_productable
    before_action :set_product_option
    before_action :set_option, only: [:destroy]

    def create
      if option_ids.include?(:option_ids)
        create_option_ids
      else
        @options = @productable.options.new(options_params)
        @options.values = option_ids[:values]
        @options.product_ids = @product.id
        if @options.save
          render json: own_options(params[:profile_id], params[:product_id]),
                 status: 200
        else
          render json: @options.errors,
                 status: 422
        end
      end
    end

    def create_option_ids
      @product.update(option_ids: option_ids[:option_ids])
      if @product.save
        render json: own_options(params[:profile_id], params[:product_id]),
               status: 200
      else
        render json: @product.errors,
               status: 422
      end
    end


    def destroy
      if @option.destroy
        render json: @option, status: 200
      else
        render json: @option.errors, status: 422
      end
    end

  end
end
