module ProductSearch
	extend ActiveSupport::Concern

	private

	def product_params
		params.require(:product).permit(:name, :height, :width, :weight, :price, { product_relations: [] })
	end

  def set_product
  	@product = @productable.products.find(params[:id])
  end

  def model_name
    params[:type_profile].singularize.camelize.constantize
  end

  # to show and index actions
  def public_productable
  	@productable = model_name.find_by_id_and_type_profile(params[:profile_id],
                                                          params[:type_profile].singularize)
  end

  # to create, destroy and update
  def current_user_productable
  	@productable = model_name.find_by_id_and_type_profile_and_user_id(params[:profile_id],
                                                          						params[:type_profile].singularize,
                                                          						current_user.id)
  end

	#Concerns pendientes para ser modularizados
	def custom_fields_params
		params.require(:custom_fields).permit(:name, :product_id)
	end

	def set_field
		@custom_field = CustomField.find(params[:field_id])
	end

	def own_custom_fields(profile, product)
		model_name.find(profile).products.find(product).as_json(root: true, include: :custom_fields)
	end
	#----

end
