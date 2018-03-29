module Api::V1::Products
	class ShowController < ProductsController
		before_action :authenticate_v1_user!, only: [:show_own]
		before_action :public_productable, only: [:show, :index]
    before_action :set_product, only: [:show]
		def index
      if @productable.respond_to? :products
      	# @products = @productable.products
      	# render json: @products
				render json:{
					status: 'success',
	        data:   model_name.where(id: @productable.id).as_json(
						root: true,
						include: {
							products: {
								include: {
									tags: {},
									price_ranges: {},
									options:{},
									custom_fields:{},
									categories:{}
								}
							}
						}
					)
				}
      else
      	render json: { data: [], errors: 'No products found' }, status: 402
      end
    end

    def show
    	render json: @product
    end

    def search_tag
      @tags = params[:tags].gsub(/[\[\]]/, '').split(',')
      # byebug
      result = Product.tagged_with(@tags, :any => true)
      render json: {
        status: 'done',
        data:   result
      }
    end

    def show_own
      #vbyebug
      @products = []
      direct_staff = current_v1_user.pymes.to_a.concat(current_v1_user.independents.to_a)
      direct_staff.each do |thing|
        @products += thing.try(:products)
      end
      render json: @products
      # current_user.independents
    end
	end
end
