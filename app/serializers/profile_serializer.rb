class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :type_profile, :title, :name, :score,
             :email, :banner, :photo, :launched, :phone, :url, :address,
             :vision, :mission, :description, :web, :profile, :experience,
             :validation, :censured, :social_account, :categories, :locations,
             :options, :custom_fields, :slug
  # attributes *Profile.column_name
end
