class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :type_profile, :title, :created_at, :updated_at, :slug, :score,
             :email, :banner, :photo, :launched, :phone, :url, :address,
             :vision, :mission, :description, :web, :profile, :experience,
             :validation, :censured, :social_account, :categories, :subcategories,
             :locations, :options, :custom_fields

   def categories
     object.categories.as_json(
       only: %i[id name]
     )
   end

   def subcategories
     ids = object.products.collect{|product| product.subcategories.pluck(:id)}.flatten.sort
     Subcategory.where(id: ids).map{|subcategory| object_subcategories(subcategory, ids)}
   end

  private

  def object_subcategories(subcategory, ids)
    @subcategories = {
      id: subcategory.id,
      name: subcategory.name,
      product_charged: ids.count(subcategory.id)
    }
  end

end
