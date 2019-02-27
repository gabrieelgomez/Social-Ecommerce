class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :type_profile, :title, :slug, :score,
             :email, :banner, :photo, :launched, :phone, :url, :address,
             :vision, :mission, :description, :web, :profile, :experience,
             :validation, :censured, :social_account, :categories, :locations,
             :options, :custom_fields
  # attributes *Profile.column_name
  def categories
    object.categories.map{ |category| object_categories(category)}
  end

  private

  def object_categories(category)
    @categories = {
      id: category.id,
      name: category.name,
      subcategories: category.subcategories.select{|subcategory| subcategory.products.count.positive? }
                                  .as_json(
                                    only: %i[id name],
                                    methods: %i[products_charged]
                                  )
    }
  end

  # def subcategories
  #   object.subcategories.select{|subcategory|
  #     subcategory.products.count.positive?
  #   }.as_json(only: %i[id name category_id], methods: %i[products_charged])
  # end

end
