module Api::V1::Products
	class ShowController < ProductsController
		# before_action :authenticate_user!
		before_action :set_product, only: [:show]
		before_action :set_productable, only: [:show, :index]
		def index
      if @productable.respond_to? :products
      	@products = @productable.products
      	render json: @products 	
      else
      	render json: { data: [], errors: 'No products found' }, status: 402
      end      
    end	

    def show
    	byebug
    	render json: @productable
    end

    private

    def set_productable
    	@productable = model_name.find_by_id_and_type_profile(params[:profile_id], 
                                                            params[:type_profile].singularize)
    end

    def set_product
    	@product = Product.find(params[:id])
    end

    def model_name
      params[:type_profile].singularize.camelize.constantize
    end
	end
end