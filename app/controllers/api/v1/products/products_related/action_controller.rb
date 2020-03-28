module Api::V1::Products::ProductsRelated
  class ActionController < ProductsRelatedController
    before_action :authenticate_v1_user!
    before_action :current_user_productable, only: %i[create]
    # before_action :set_product, only: [:create]

    def create
      @product = @productable.products.find(params[:product_id])
      ids = params[:products]
      reals = @productable.products.map(&:id) # Make a lambda with this
      present_prod = ids.select { |n| reals.include?(n) } # And this
      if @product.update(product_relations: present_prod)
        render json: @product, status: 200
      else
        render json: @product.errors, status: 422
      end
    end
  end
end
