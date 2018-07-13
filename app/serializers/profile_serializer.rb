class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :name, :score,
             :email, :banner, :photo, :launched, :phone, :url, :address,
             :vision, :mission, :description, :web, :profile, :experience,
             :social_account, :categories, :locations, :options, :custom_fields
  # attributes *Profile.column_name
end
