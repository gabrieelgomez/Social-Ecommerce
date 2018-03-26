module Api::V1::Products
	class ShowController < ProductsController
		before_action :authenticate_user!, only: [:show_own]

		before_action :public_productable, only: [:show, :index]
    before_action :set_product, only: [:show]
		def index
      if @productable.respond_to? :products
      	# @products = @productable.products
      	# render json: @products
				render json:{
					status: 'success',
	        data:   model_name.where(id: @productable.id).as_json(root: true, include: { products: {include: :custom_fields} })
				}
      else
      	render json: { data: [], errors: 'No products found' }, status: 402
      end
    end

    def show
      # begin
      #   @product = @productable.products.find(params[:id])
      # rescue ActiveRecord::RecordNotFound => e
      #   @product = []
      # end
      # @product = @productable.products.find(params[:id])
    	render json: @product
    end

    def show_own
      #vbyebug
      @products = []
      direct_staff = current_user.pymes.to_a.concat(current_user.independents.to_a)
      direct_staff.each do |thing|
        @products += thing.try(:products)
      end
      render json: @products
      # current_user.independents
    end
	end
end
