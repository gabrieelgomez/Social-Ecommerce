class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :country, :phone, :comments, :contact_type
end
