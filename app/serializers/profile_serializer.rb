class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :type_profile, :title, :name,
  					 :email, :banner, :photo, :launched, :phone, :url, :address,
  					 :vision, :mission, :description, :web, :profile, :experience, :products
end
