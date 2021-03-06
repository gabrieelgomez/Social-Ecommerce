class Pymes::ShowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :type_profile, :title, :slug, :score,
              :email, :banner, :photo, :launched, :phone, :url, :address,
              :vision, :mission, :description, :web, :profile, :experience,
              :validation, :censured, :social_account, :categories, :locations,
              :options, :custom_fields, :slug
  # has_many :products

  def attributes(args)
    data = super
    fields = scope[:fields]
    return data unless fields
    fields.split(',').each_with_object({}) do |field, hash|
      hash[field] = object[field]
    end
  end
end
