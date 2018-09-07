class Contact < ApplicationRecord
  belongs_to :contact_type
  belongs_to :profile

  validates :name, :email, :comments, presence: true
end
